# frozen_string_literal: true
# This migration comes from decidim_accountability (originally 20200320105903)

class IndexForeignKeysInDecidimAccountabilityResults < ActiveRecord::Migration[5.2]
  def change
    # This index already exists in production
    # add_index :decidim_accountability_results, :external_id
  end
end
