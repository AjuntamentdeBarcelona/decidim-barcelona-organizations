# frozen_string_literal: true
# This migration comes from decidim_consultations (originally 20210310120626)

class AddFollowableCounterCacheToConsultations < ActiveRecord::Migration[5.2]
  class Question < ApplicationRecord
    self.table_name = :decidim_consultations_questions
  end

  def change
    add_column :decidim_consultations_questions, :follows_count, :integer, null: false, default: 0, index: true

    reversible do |dir|
      dir.up do
        Question.reset_column_information
        Question.find_each do |record|
          record.class.reset_counters(record.id, :follows)
        end
      end
    end
  end
end
