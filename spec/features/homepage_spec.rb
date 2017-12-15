# frozen_string_literal: true

require 'rails_helper'

describe 'Visit the home page', type: :feature, perform_enqueued: true do
  let(:organization) { create :organization }

  before do
    switch_to_host(organization.host)
  end

  it 'renders the home page' do
    visit decidim.root_path
    expect(page).to have_content('Welcome')
  end
end
