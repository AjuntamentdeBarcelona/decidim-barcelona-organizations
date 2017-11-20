class OrganizationObserver < ActiveRecord::Observer
  observe Decidim::Organization

  def after_save(organization)
    return unless organization.host_changed?

    app_name = Rails.application.secrets.heroku_app_name
    return unless app_name.present?

    $heroku.domain.delete(app_name, organization.host_was) if organization.host_was.present?
    $heroku.domain.create(app_name, hostname: organization.host)
  end
end
