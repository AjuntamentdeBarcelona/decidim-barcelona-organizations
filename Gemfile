# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION = { git: "https://github.com/decidim/decidim", branch: "0.19-stable" }

gem "decidim", DECIDIM_VERSION
gem "decidim-initiatives", DECIDIM_VERSION
gem "decidim-consultations", DECIDIM_VERSION
gem "decidim-conferences", DECIDIM_VERSION
# Change term_customizer dependency to ruby-gems' when term-customizer is compatible with DECIDIM_VERSION
gem "decidim-term_customizer", git: "https://github.com/CodiTramuntana/decidim-module-term_customizer" 

gem "puma"
gem "uglifier"
gem "wicked_pdf"
gem "wkhtmltopdf-binary"

# geocoder can not be upgraded to 1.6 until the Here maps api key is changed for the new one
gem "geocoder", "~> 1.5.2"

gem 'rails-observers'

gem "faker", "~> 1.8.4"
gem "sidekiq"

group :development, :test do
  gem "byebug", platform: :mri

  gem "decidim-dev", DECIDIM_VERSION
  gem "rspec-rails"
end

group :development do
  gem "letter_opener_web", "~> 1.3.0"
  gem "listen", "~> 3.1.0"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console"
end

group :production do
  gem 'passenger'
  gem 'fog-aws'
  gem 'dalli'
  gem 'sendgrid-ruby'
  gem 'newrelic_rpm'
  gem 'lograge'
  gem 'sentry-raven'
  gem 'rails_autoscale_agent'
  gem 'platform-api'
end
