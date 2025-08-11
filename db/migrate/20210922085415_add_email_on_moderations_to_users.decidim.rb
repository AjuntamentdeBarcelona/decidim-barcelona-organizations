# frozen_string_literal: true

# This migration comes from decidim (originally 20210208134328)
# This file has been modified by `decidim upgrade:migrations` task on 2025-08-11 12:26:28 UTC
class AddEmailOnModerationsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_users, :email_on_moderations, :boolean, default: true
  end
end
