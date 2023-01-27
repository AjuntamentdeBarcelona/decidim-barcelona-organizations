# frozen_string_literal: true

class OrganizationObserver < ActiveRecord::Observer
  observe Decidim::Organization

  def after_save(organization)
    return unless organization.host_changed?

    app_name = Rails.application.secrets.heroku_app_name
    return if app_name.blank?

    # rubocop:disable Style/GlobalVars
    $heroku.domain.delete(app_name, organization.host_was) if organization.host_was.present?
    $heroku.domain.create(app_name, hostname: organization.host)
    # rubocop:enable Style/GlobalVars
  end

  def after_destroy(organization)
    app_name = Rails.application.secrets.heroku_app_name
    return if app_name.blank?

    # rubocop:disable Style/GlobalVars
    $heroku.domain.delete(app_name, organization.host)
    # rubocop:enable Style/GlobalVars
  end
end
