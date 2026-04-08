# frozen_string_literal: true

# This migration comes from decidim_meetings (originally 20181107175558)
# This file has been modified by `decidim upgrade:migrations` task on 2026-03-26 14:31:00 UTC
class AddQuestionnaireToExistingMeetings < ActiveRecord::Migration[5.2]
  class Meeting < ApplicationRecord
    self.table_name = :decidim_meetings_meetings
    include Decidim::HasComponent
    include Decidim::Forms::HasQuestionnaire
  end

  def change
    Meeting.transaction do
      Meeting.unscoped.find_each do |meeting|
        if meeting.component.present? && meeting.questionnaire.blank?
          meeting.update!(
            questionnaire: Decidim::Forms::Questionnaire.new
          )
        end
      end
    end
  end
end
