Rails.application.routes.draw do
  resources :friend_requests
  devise_for :users

  if Rails.env.development?
    require 'sidekiq/web'
    mount Sidekiq::Web => '/sidekiq'

    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end

  devise_scope :user do
    unauthenticated :user do
      root to: 'devise/registrations#new'
    end

    authenticated :user do
      root to: 'dashboards#show', as: :authenticated_root
    end

  end

  get :callbacks, to: 'callbacks#new'
  post :import, to: 'ynab_imports#create'

  resources :settings, only: [:index]
end
