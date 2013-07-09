require 'resque/server'

require 'resque/server'

#TODO: make env variables
#TODO: install airbrake and activate for resque jobs: google resque airbrake
#TODO: deploy to heroku

Resque::Server.class_eval do

  use Rack::Auth::Basic do |email, password|
    email == ENV['RESQUE_EMAIL'] && password == ENV['RESQUE_PASSWORD']
  end

end

Sentimentalist::Application.routes.draw do

  mount Resque::Server, at: '/resque'

  namespace :api, defaults: {format: 'json'}  do
    namespace :version1  do
      resources :sentiments, only: [:index]
    end
  end

  resources :dashboard, only: [:index, :load]
  resources :welcome, only: [:index]
  resources :users, only: [:destroy]
  resources :machine_learners, only: [:update]

  match '/resque', to: Resque::Server, via: :all

  match '/auth/twitter/callback', to: 'sessions#create'

  match "/signout", to: "sessions#destroy", as: :signout
  match '/load', to: 'dashboard#load'
  match '/auth/failure', to: 'sessions#error', as: 'failure'

  match ':controller(/:action)'

  root to: 'welcome#index'

end
