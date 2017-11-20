require 'platform-api'

$heroku = PlatformAPI.connect_oauth(Rails.application.secrets.heroku_oauth_token)
