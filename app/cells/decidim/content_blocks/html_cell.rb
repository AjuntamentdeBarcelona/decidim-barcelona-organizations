# frozen_string_literal: true

module Decidim
  module ContentBlocks
    class HtmlCell < Decidim::ViewModel
      def block_id
        "html-block-#{model.manifest_name.parameterize.gsub("_", "-")}"
      end

      def html_content
        # Overriden to use a custom scrubber that also allows inline SVG
        # icons (`<svg><use>`), which the default AdminInputScrubber strips.
        decidim_sanitize_editor_admin(
          translated_attribute(model.settings.html_content),
          scrubber: Decidim::SvgAdminInputScrubber.new
        )
      end
    end
  end
end
