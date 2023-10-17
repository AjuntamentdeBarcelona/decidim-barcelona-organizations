# frozen_string_literal: true

Rails.application.config.to_prepare do
  Decidim::ForceAuthentication.prepend(Decidim::ForceAuthenticationOverride)
end
