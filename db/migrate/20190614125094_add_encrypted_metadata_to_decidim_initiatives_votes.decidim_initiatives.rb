# frozen_string_literal: true

# This migration comes from decidim_initiatives (originally 20181220134322)
# This file has been modified by `decidim upgrade:migrations` task on 2025-08-11 12:26:29 UTC
class AddEncryptedMetadataToDecidimInitiativesVotes < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_initiatives_votes, :encrypted_metadata, :text
  end
end
