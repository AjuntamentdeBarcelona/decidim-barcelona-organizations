# frozen_string_literal: true

# This migration comes from decidim (originally 20161107152228)
# This file has been modified by `decidim upgrade:migrations` task on 2025-08-11 12:26:29 UTC
class RemoveNotNullOnStepPosition < ActiveRecord::Migration[5.0]
  def change
    change_column :decidim_participatory_process_steps, :position, :integer, null: true
  end
end
