# frozen_string_literal: true

require "sidekiq/web"
Rails.application.routes.draw do
  authenticate :admin do
    mount Sidekiq::Web => "/sidekiq"
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  mount Decidim::Core::Engine => "/"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
