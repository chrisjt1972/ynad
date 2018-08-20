Rails.application.routes.draw do
  resources :friend_requests
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  if Rails.env.development?
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

  resources :budgets, only: [:update]
  resources :filters, only: [:index]
  resources :preferences, only: [:update]

  get '/privacy_policy', to: 'legal/privacy_policies#index'
  post '/disconnect_ynab', to: 'settings#disconnect_ynab'
  delete '/destroy_user', to: 'settings#destroy_user'
end
