Sentimentalist::Application.routes.draw do

  resources :dashboard, only: [:index]
  resources :welcome

  root to: 'welcome#index'

  match '/auth/twitter/callback', to: 'sessions#create'

  match "/signout", to: "sessions#destroy", as: :signout
  match '/about', to: 'welcome#about'
  match '/privacy', to: 'welcome#privacy'
  match '/auth/failure', to: 'sessions#error', as: 'failure'

  match ':controller(/:action(/:id))(.:format)'

  mount Resque::Server, at: '/resque'
end
