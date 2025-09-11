# frozen_string_literal: true

require "rails_helper"

describe "Visit the home page", :perform_enqueued do
  let(:organization) { create(:organization) }
  let!(:content_block) { create(:content_block, organization:, manifest_name: :hero) }

  before do
    switch_to_host(organization.host)
  end

  it "renders the home page" do
    visit decidim.root_path
    expect(page).to have_content("Welcome")
  end
end
