# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION = "~> 0.30.0"

gem "decidim", DECIDIM_VERSION
gem "decidim-conferences", DECIDIM_VERSION
gem "decidim-initiatives", DECIDIM_VERSION
gem "decidim-templates", DECIDIM_VERSION

# gem "decidim-decidim_awesome", "~> 0.12.0"
gem "decidim-direct_verifications", git: "https://github.com/Platoniq/decidim-verifications-direct_verifications", branch: "deps/decidim-0.30"
gem "decidim-term_customizer", git: "https://github.com/Platoniq/decidim-module-term_customizer", branch: "main"

gem "puma", ">= 5.0.0"
gem "uglifier"
gem "wicked_pdf", "~> 2.1"
gem "wkhtmltopdf-binary"

gem "rails-observers"
gem "webrick"

gem "faker"
gem "sidekiq"

group :development, :test do
  gem "byebug", platform: :mri
  gem "mdl"
  gem "rubocop-faker"

  gem "decidim-dev", DECIDIM_VERSION
  gem "rspec-rails"
end

group :development do
  gem "letter_opener_web", "~> 2.0.0"
  gem "listen", "~> 3.1"
  gem "web-console", "~> 4.2"

  gem "capistrano", "~> 3.19"
  gem "capistrano3-puma", "~> 6.0"
  gem "capistrano-bundler", "~> 2.1"
  gem "capistrano-rails", "~> 1.7"
  gem "capistrano-rails-console", "~> 2.3"
  gem "capistrano-rbenv", "~> 2.2"
  gem "capistrano-sidekiq", "~> 3.0"
end

group :production do
  gem "aws-sdk-s3", require: false
  gem "dalli"
  gem "fog-aws"
  gem "lograge"
  gem "platform-api"
  gem "rails_autoscale_agent"
  gem "sendgrid-ruby"
  gem "sentry-raven"
  gem "whenever", require: false
end
