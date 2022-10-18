# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_MAIN_BRANCH = "release/0.24-stable"

DECIDIM_VERSION = { git: "https://github.com/decidim/decidim", branch: DECIDIM_MAIN_BRANCH }.freeze

gem "decidim", DECIDIM_VERSION
gem "decidim-initiatives", DECIDIM_VERSION
gem "decidim-consultations", DECIDIM_VERSION
gem "decidim-conferences", DECIDIM_VERSION
gem "decidim-templates", DECIDIM_VERSION
# Change term_customizer dependency to ruby-gems' when term-customizer is compatible with DECIDIM_VERSION
gem "decidim-term_customizer", git: "https://github.com/CodiTramuntana/decidim-module-term_customizer"

# Decidim::DirectVerifications - https://github.com/Platoniq/decidim-verifications-direct_verifications
gem "decidim-direct_verifications"

gem "decidim-decidim_awesome"

gem "rails", "< 6"
gem "puma"
gem "uglifier"
gem "wicked_pdf"
gem "wkhtmltopdf-binary"

gem 'rails-observers'

gem "faker", "~> 2.14.0"
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
  gem 'fog-aws'
  gem 'dalli'
  gem 'sendgrid-ruby'
  gem 'newrelic_rpm'
  gem 'lograge'
  gem 'sentry-raven'
  gem 'rails_autoscale_agent'
  gem 'platform-api'
end
