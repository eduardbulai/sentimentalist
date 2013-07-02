Sentimentalist::Application.routes.draw do

  mount Resque::Server, at: '/resque'

  resources :dashboard, only: [:index, :load]
  resources :welcome, only: [:index]

  match '/auth/twitter/callback', to: 'sessions#create'

  match "/signout", to: "sessions#destroy", as: :signout
  match '/load', to: 'dashboard#load'
  match '/auth/failure', to: 'sessions#error', as: 'failure'

  match ':controller(/:action(/:id))(.:format)'

  root to: 'welcome#index'

end
