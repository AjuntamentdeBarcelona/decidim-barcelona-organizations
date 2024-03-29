# frozen_string_literal: true

require "spec_helper"

# We make sure that the checksum of the file overriden is the same
# as the expected. If this test fails, it means that the overriden
# file should be updated to match any change/bug fix introduced in the core
checksums = [
  {
    package: "decidim-conferences",
    files: {
      "/app/views/layouts/decidim/_conference_hero.html.erb" => "db2e565169a5ce7f8a3e7d03dd0ebfd9",
      "/app/views/layouts/decidim/_conferences_nav.html.erb" => "65d135dc663b18be367a7c514ae7c0a6",
      "/app/views/decidim/conferences/conferences/show.html.erb" => "94e3fb8ee4e092678ce0f229c87e1bc0"
    }
  }
]

describe "Overriden files", type: :view do
  checksums.each do |item|
    # rubocop:disable Rails/DynamicFindBy
    spec = ::Gem::Specification.find_by_name(item[:package])
    # rubocop:enable Rails/DynamicFindBy
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
