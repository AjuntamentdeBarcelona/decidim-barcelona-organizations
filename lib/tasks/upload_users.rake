require 'csv'

namespace :users do
  desc <<~EODESC
  Loads users from csv with headers: Name, Nickname, Email, password.
  Users are not confirmed and will not recive any invitation.
  Expects the `;` separator.

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

    csv_text = File.read(args[:file_name])
    csv = CSV.parse(csv_text, headers: true, col_sep: ';');
    csv.each_with_index do |row, idx|
      hash = row.to_hash
      puts "row:#{row}"
      user= Decidim::User.new(
        decidim_organization_id: org.id,
        name: row['Name'],
        nickname: row['Nickname'],
        email: row['Email'],
        password: row['password'],
        password_confirmation: row['password'],
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
      user= Decidim::User.where(decidim_organization_id: org.id).find_by_nickname(row['Nickname'])
      puts "cant' find: #{row['Nickname']}" and next if !user
      user.name= row['Name']
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
