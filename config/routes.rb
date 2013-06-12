Sentimentalist::Application.routes.draw do
<<<<<<< HEAD
  devise_for :users

  resources :dashboard, only: [:index]

  # The priority is based upon order of creation:
  # first created -> highest priority.
=======
>>>>>>> resque

  resources :dashboard, only: [:index]
  resources :welcome

  root to: 'welcome#index'

  match '/auth/twitter/callback', to: 'sessions#create'

  match "/signout", to: "sessions#destroy", as: :signout
  match '/about', to: 'welcome#about'
  match '/privacy', to: 'welcome#privacy'
  match '/auth/failure', to: 'sessions#error', as: 'failure'

  match ':controller(/:action(/:id))(.:format)'

<<<<<<< HEAD
  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'welcome#index'

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  match '/about', to: 'welcome#about'
  match '/privacy', to: 'welcome#privacy'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
=======
  mount Resque::Server, at: '/resque'
>>>>>>> resque
end
