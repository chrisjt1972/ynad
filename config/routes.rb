Rails.application.routes.draw do
  devise_for :users

  # TODO: Restrict access
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

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
