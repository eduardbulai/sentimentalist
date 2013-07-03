require 'api_constraints'

Sentimentalist::Application.routes.draw do

  mount Resque::Server, at: '/resque'

  namespace :api do
    # /api/... Api::
    scope module: :version1, constraints: ApiConstraints.new(version: 1) do
      resources :dashboard
    end
  end

  resources :dashboard, only: [:index, :load]
  resources :welcome, only: [:index]
  resources :users, only: [:destroy]
  resources :machine_learners, only: [:update]



  match '/auth/twitter/callback', to: 'sessions#create'

  match "/signout", to: "sessions#destroy", as: :signout
  match '/load', to: 'dashboard#load'
  match '/auth/failure', to: 'sessions#error', as: 'failure'

  match ':controller(/:action)'

  root to: 'welcome#index'

end
