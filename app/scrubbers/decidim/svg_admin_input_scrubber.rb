# frozen_string_literal: true

module Decidim
  # Extends the admin scrubber to allow inline SVG icons (`<svg><use href>`)
  # in admin-authored content, as used by the HTML content block on the
  # homepage. Event handlers and `javascript:` URIs are still stripped by
  # the underlying PermitScrubber, and dangerous SVG elements such as
  # `script`, `foreignObject` or `animate` remain disallowed.
  class SvgAdminInputScrubber < AdminInputScrubber
    private

    def custom_allowed_tags
      super + %w(svg use)
    end

    def custom_allowed_attributes
      super + %w(role aria-hidden)
    end
  end
end
