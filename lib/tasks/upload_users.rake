require 'csv'

namespace :users do
  desc <<~EODESC
  Expected arguments are:
  - org_id: (mandatory) The id for the organization where the users should be associated.
  EODESC
  task :delete_participants do |task, args|
    set_remote_db_if_required

    org= Decidim::Organization.find(args[:org_id])
    puts "Organization found: #{org.host} - #{org.name}"

    participants= Decidim::User.where(decidim_organization_id: org.id).where(admin: false)
    puts "Destroying #{participants.count} participants"
    participants.destroy_all
  end

  desc <<~EODESC
  Loads users from csv with headers: Name, Email, Nickname(optional), password(optional).
  Users are not confirmed and will not recive any invitation.
  Expects the `;` separator.

  Make sure that the file is in UTF-8 format, if not:
  ```
  iconv -f ISO-8859-15 -t UTF-8 user-list.csv
  ```

  To support Heroku, a remote db connection can be forced by setting a
  REMOTE_DB_URL environment variable like:
  ```
  REMOTE_DB_URL=$(heroku config:get DATABASE_URL -a your-app) bin/rails users:load[1,tmp/users.csv]
  ```

  Expected arguments are:
  - org_id: (mandatory) The id for the organization where the users should be associated.
  EODESC
  task :load, [:org_id, :file_name] => :environment do |task, args|
    set_remote_db_if_required

    org= Decidim::Organization.find(args[:org_id])
    puts "Organization found: #{org.host} - #{org.name}"

    col_sep= ','#';'
    csv_text = File.read(args[:file_name])
    csv = CSV.parse(csv_text, headers: true, col_sep: col_sep);
    csv.each_with_index do |row, idx|
      puts "row:#{row}"
      row = row.to_hash
      unless row['Name']
        puts "#{idx}ignored!#{row}"
      end
      nickname= row['Nickname'] || Decidim::User.nicknamize(row['Name'])
      password= row['password'] || "decidim1234#{idx}"
      user= Decidim::User.new(
        decidim_organization_id: org.id,
        name: row['Name'],
        nickname: nickname,
        email: row['Email'],
        password: password,
        password_confirmation: password,
        )
      user.skip_invitation = true
      if user.save(validate: false)
        puts "-#{idx}-#{user.id}"
      else
        puts "#{idx}X#{user.email}::#{user.errors.full_messages}"
        exit
      end
    end
    puts "Done."
  end

  task :update, [:org_id, :file_name] => :environment do |task, args|
    set_remote_db_if_required

    org= Decidim::Organization.find(args[:org_id])
    puts "Organization found: #{org.host} - #{org.name}"

    csv_text = File.read(args[:file_name])
    csv = CSV.parse(csv_text, headers: true, col_sep: ';');
    csv.each_with_index do |row, idx|
      hash = row.to_hash
      user= Decidim::User.where(decidim_organization_id: org.id).find_by_nickname(hash['Nickname'])
      puts "cant' find: #{hash['Nickname']}" and next if !user
      user.name= hash['Name']
      if user.save(validate: false)
        puts "-#{idx}-#{user.id}"
      else
        puts "#{idx}X#{user.email}::#{user.errors.full_messages}"
        exit
      end
    end
    puts "Done."
  end

  def set_remote_db_if_required
    ActiveRecord::Base.establish_connection ENV['REMOTE_DB_URL']
  end
end
