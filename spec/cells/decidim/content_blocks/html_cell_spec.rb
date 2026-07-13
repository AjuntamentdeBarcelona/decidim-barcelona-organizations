# frozen_string_literal: true

require "rails_helper"

describe Decidim::ContentBlocks::HtmlCell, type: :cell do
  subject { cell(content_block.cell, content_block).call }

  let(:organization) { create(:organization) }
  let(:content_block) { create(:content_block, organization:, manifest_name: :html, scope_name: :homepage, settings:) }
  let(:settings) do
    {
      "html_content_en" => html_content
    }
  end

  controller Decidim::PagesController

  context "when the content contains inline SVG icons" do
    let(:html_content) do
      <<~HTML
        <svg width="1em" height="1em" role="img" aria-hidden="true" class="icon">
          <use href="/decidim-packs/media/images/remixicon.symbol.svg#ri-question-line"></use>
        </svg>
      HTML
    end

    it "keeps the svg and use tags with their attributes" do
      expect(subject.to_s).to include("<svg")
      expect(subject.to_s).to include("<use")
      expect(subject.to_s).to include("aria-hidden")
    end
  end

  context "when the content contains a script tag" do
    let(:html_content) { '<p>Safe content</p><script>alert("xss")</script>' }

    it "strips the script tag" do
      expect(subject).to have_text("Safe content")
      expect(subject.to_s).not_to include("<script>")
    end
  end

  context "when the content contains an event handler attribute" do
    let(:html_content) { '<svg onload="alert(1)"><use href="javascript:alert(1)"></use></svg>' }

    it "strips the event handler and the javascript URI" do
      expect(subject.to_s).not_to include("onload")
      expect(subject.to_s).not_to include("javascript:")
    end
  end
end
