# frozen_string_literal: true

require "rails_helper"

# We make sure that the checksum of the file overriden is the same
# as the expected. If this test fails, it means that the overriden
# file should be updated to match any change/bug fix introduced in the core
checksums = [
  {
    package: "decidim-conferences",
    files: {
      "/app/helpers/decidim/conferences/conference_helper.rb" => "9351b493c46fe95974293572ae1a534d",
      "/app/views/decidim/conferences/conferences/_conference_hero.html.erb" => "c49e3bfd348285ea3fcd6abcd00cf350",
      "/app/views/decidim/conferences/conferences/show.html.erb" => "16ff68b3c8208f93813f8f6354528c17"
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
