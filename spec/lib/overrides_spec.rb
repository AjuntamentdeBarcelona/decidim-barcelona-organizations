# frozen_string_literal: true

require "rails_helper"

# We make sure that the checksum of the file overriden is the same
# as the expected. If this test fails, it means that the overriden
# file should be updated to match any change/bug fix introduced in the core
checksums = [
  {
    package: "decidim-conferences",
    files: {
      "/app/helpers/decidim/conferences/conference_helper.rb" => "1bc756869b024713e4c182287853bd36",
      "/app/views/decidim/conferences/conferences/_conference_hero.html.erb" => "da4e86d29cf4272356d4bed6130d641f",
      "/app/views/decidim/conferences/conferences/show.html.erb" => "eb94f807d798fe1ed4d1404dd1dfcad9"
    }
  }
]

describe "Overriden files", type: :view do
  checksums.each do |item|
    spec = Gem::Specification.find_by_name(item[:package])
    item[:files].each do |file, signature|
      it "#{spec.gem_dir}#{file} matches checksum" do
        expect(md5("#{spec.gem_dir}#{file}")).to eq(signature)
      end
    end
  end

  private

  def md5(file)
    Digest::MD5.hexdigest(File.read(file))
  end
end
