# frozen_string_literal: true

if Rails.application.secrets.dig(:omniauth, :decidim, :enabled)
  Devise.setup do |config|
    config.omniauth :decidim,
                    Rails.application.secrets.dig(:omniauth, :decidim, :client_id),
                    Rails.application.secrets.dig(:omniauth, :decidim, :client_secret),
                    Rails.application.secrets.dig(:omniauth, :decidim, :site_url),
                    scope: :public
  end
  Decidim::User.omniauth_providers << :decidim

end