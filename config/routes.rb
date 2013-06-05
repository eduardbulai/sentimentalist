Sentimentalist::Application.routes.draw do

  resources :dashboard, only: [:index]
  resources :welcome

  root :to => 'welcome#index'

  match '/auth/twitter/callback', to: 'sessions#create'

  match "/signout" => "sessions#destroy", :as=>:signout
  match '/about', to: 'welcome#about'
  match '/privacy', to: 'welcome#privacy'

  match ':controller(/:action(/:id))(.:format)'
end
