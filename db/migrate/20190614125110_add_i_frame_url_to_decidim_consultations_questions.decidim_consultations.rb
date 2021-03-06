# frozen_string_literal: true
# This migration comes from decidim_consultations (originally 20180129063438)

class AddIFrameUrlToDecidimConsultationsQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_consultations_questions, :i_frame_url, :string
    add_column :decidim_consultations_questions, :external_voting, :boolean
  end
end
