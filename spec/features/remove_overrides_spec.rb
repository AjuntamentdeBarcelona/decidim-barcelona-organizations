# frozen_string_literal: true

require "rails_helper"

describe "Overrides" do
  scenario "remove override to fix participatory text newline absence" do
    # remove /app/presenters/decidim/proposals/proposal_presenter.rb after https://github.com/decidim/decidim/pull/6158 is merged
    expect(Decidim.version).to be < "0.22"
  end
end
