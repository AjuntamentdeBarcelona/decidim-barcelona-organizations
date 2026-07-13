# frozen_string_literal: true

require "rails_helper"

# We make sure that the checksum of the file overriden is the same
# as the expected. If this test fails, it means that the overriden
# file should be updated to match any change/bug fix introduced in the core
checksums = [
  {
    # The cell is overriden to keep inline SVG icons (`<svg><use>`) that core's
    # sanitization strips, using the custom Decidim::SvgAdminInputScrubber. The
    # scrubber it extends is tracked too, to notice if core starts allowing the
    # tags we customized. If no longer needed, also remove
    # app/scrubbers/decidim/svg_admin_input_scrubber.rb and the cell spec.
    package: "decidim-core",
    files: {
      "/app/cells/decidim/content_blocks/html_cell.rb" => "67df12cd1caefa3a8ddb7d340dcd057f",
      "/app/scrubbers/decidim/admin_input_scrubber.rb" => "457f756c5a7c3376e3a882d785d934e8"
    }
  },
  {
    package: "decidim-conferences",
    files: {
      "/app/helpers/decidim/conferences/conference_helper.rb" => "9351b493c46fe95974293572ae1a534d",
      "/app/views/decidim/conferences/conferences/_conference_hero.html.erb" => "c49e3bfd348285ea3fcd6abcd00cf350",
      "/app/views/decidim/conferences/conferences/show.html.erb" => "d8244b43d93c792962b2114f6e488b09"
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
