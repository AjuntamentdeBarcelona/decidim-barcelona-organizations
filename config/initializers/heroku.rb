# frozen_string_literal: true

require "platform-api"

# rubocop:disable Style/GlobalVars
$heroku = PlatformAPI.connect_oauth(Rails.application.secrets.heroku_oauth_token)
# rubocop:enable Style/GlobalVars
