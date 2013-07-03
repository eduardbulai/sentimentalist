Sentimentalist::Application.routes.draw do

  mount Resque::Server, at: '/resque'

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
