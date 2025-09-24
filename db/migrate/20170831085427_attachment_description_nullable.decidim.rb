# frozen_string_literal: true

# This migration comes from decidim (originally 20170804125402)
# This file has been modified by `decidim upgrade:migrations` task on 2025-08-11 12:26:29 UTC
class AttachmentDescriptionNullable < ActiveRecord::Migration[5.1]
  def change
    change_column :decidim_attachments, :description, :jsonb, null: true
  end
end
