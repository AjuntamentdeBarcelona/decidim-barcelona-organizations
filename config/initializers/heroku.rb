# frozen_string_literal: true

require "platform-api"

# rubocop:disable Style/GlobalVars
$heroku = PlatformAPI.connect_oauth(ENV.fetch("HEROKU_OAUTH_TOKEN", nil))
# rubocop:enable Style/GlobalVars
