Sentimentalist::Application.routes.draw do

  mount Resque::Server, at: '/resque'

  resources :dashboard, only: [:index]
  resources :welcome

  match '/auth/twitter/callback', to: 'sessions#create'

  match "/signout", to: "sessions#destroy", as: :signout
  match '/about', to: 'welcome#about'
  match '/privacy', to: 'welcome#privacy'
  match '/auth/failure', to: 'sessions#error', as: 'failure'

  match ':controller(/:action(/:id))(.:format)'

  root to: 'welcome#index'

end
