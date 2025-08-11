# frozen_string_literal: true

# This migration comes from decidim (originally 20170809084005)
# This file has been modified by `decidim upgrade:migrations` task on 2025-08-11 12:26:29 UTC
class AddScopesEnabledToParticipatoryProcesses < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_participatory_processes, :scopes_enabled, :boolean, null: false, default: true
  end
end
