# frozen_string_literal: true

if Rails.application.secrets.dig(:omniauth, :keycloakopenid).present?

  def setup_keycloak_provider_proc
    lambda do |env|
      request = Rack::Request.new(env)
      organization = Decidim::Organization.find_by(host: request.host)
      provider_config = organization.enabled_omniauth_providers[:keycloakopenid]

      return unless provider_config

      strategy = env["omniauth.strategy"]
      strategy.options[:client_id] = provider_config[:client_id]
      strategy.options[:client_secret] = provider_config[:client_secret]
      strategy.options[:client_options] ||= {}
      strategy.options[:client_options][:site] = provider_config[:site]
      strategy.options[:client_options][:realm] = provider_config[:realm]
    end
  end

  class OmniAuth::Strategies::KeycloakOpenId
    info do
      {
        nickname: raw_info["preferred_username"],
        name: [raw_info["given_name"], raw_info["family_name"]].compact.join(" "),
        email: raw_info["email"]
      }
    end
  end

  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :keycloak_openid,
             setup: setup_keycloak_provider_proc
  end
end

OmniAuth.config.logger = Rails.logger
