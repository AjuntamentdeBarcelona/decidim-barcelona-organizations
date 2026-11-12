# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION = "~> 0.32.2"

gem "decidim", DECIDIM_VERSION
gem "decidim-collaborative_texts", DECIDIM_VERSION
gem "decidim-conferences", DECIDIM_VERSION
gem "decidim-elections", DECIDIM_VERSION
gem "decidim-initiatives", DECIDIM_VERSION
gem "decidim-templates", DECIDIM_VERSION

gem "decidim-decidim_awesome", git: "https://github.com/decidim-ice/decidim-module-decidim_awesome", branch: "main"
gem "decidim-direct_verifications", git: "https://github.com/Platoniq/decidim-verifications-direct_verifications", branch: "main"
gem "decidim-term_customizer", git: "https://github.com/Platoniq/decidim-module-term_customizer", branch: "main"

gem "omniauth-keycloak"

# Required by decidim-api; 0.5.3 has no precompiled gem and needs Rust + libclang to build
gem "selma", "< 0.5.3"

gem "puma", ">= 5.0.0"
gem "uglifier"
gem "wicked_pdf", "~> 2.1"
gem "wkhtmltopdf-binary"

gem "rails-observers"
gem "webrick"

gem "faker"
gem "sidekiq"

gem "dotenv-rails"

group :development, :test do
  gem "byebug", platform: :mri
  gem "mdl"
  gem "rubocop-faker"

  gem "decidim-dev", DECIDIM_VERSION
  gem "rspec-rails"

  gem "debug"
  gem "ruby-lsp", require: false
  gem "ruby-lsp-rails", require: false
  gem "ruby-lsp-rspec", require: false
end

group :development do
  gem "letter_opener_web", "~> 2.0.0"
  gem "listen", "~> 3.1"
  gem "web-console", "~> 4.2"

  gem "capistrano", "~> 3.19"
  gem "capistrano3-puma", "~> 6.0"
  gem "capistrano-bundler", "~> 2.2"
  gem "capistrano-nvm"
  gem "capistrano-rails", "~> 1.7"
  gem "capistrano-rails-console", "~> 2.3"
  gem "capistrano-rbenv", "~> 2.2"
  gem "capistrano-sidekiq", "~> 3.0"
end

group :production do
  gem "appsignal"
  gem "aws-sdk-s3", require: false
  gem "dalli"
  gem "lograge"
  gem "platform-api"
  gem "whenever", require: false
end
