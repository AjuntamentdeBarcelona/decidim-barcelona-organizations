class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :basic_auth!

  private

  def basic_auth!
    return nil unless current_organization

    credentials = domain_authentications[current_organization.host]
    return unless credentials

    authenticated = authenticate_with_http_basic do |user, password|
      user == credentials[:user] && password == credentials[:password]
    end

    request_http_basic_authentication unless authenticated
  end

  def domain_authentications
    @domain_authentications ||= ENV['DOMAIN_AUTHENTICATIONS'].to_s.split(',').inject({}) do |result, authentication|
      domain, credentials = authentication.strip.split('@')
      user, password = credentials.split(':')
      result[domain] = {
        user: user,
        password: password
      }
      result
    end
  end
end
