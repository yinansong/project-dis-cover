Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => 'registrations'}

  scope "/admin" do
    resources :users do
      resources :manholecovers
    end
    resources :manholecovers
  end

  resources :roles

  resources :users, only: [:show]

  resources :manholecovers

  resources :users do
    resources :manholecovers
  end

  # This line mounts Monologue's routes at the root of your application.
  # This means, any requests to URLs such as /my-post, will go to Monologue::PostsController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  mount Monologue::Engine, at: '/blog' 

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get 'about' => 'welcome#about'
  get 'instagram' => 'welcome#instagram'

  get 'manholecovers/city/:city' => 'manholecovers#city'
  get 'manholecovers/region/:region' => 'manholecovers#region'
  get 'manholecovers/country/:country' => 'manholecovers#country'
  get 'manholecovers/year/:year' => 'manholecovers#year'
  get 'manholecovers/keyword/:keyword' => 'manholecovers#keywords'

  get 'users/:id/collection' => 'users#collection', :as => :collection_user

  get 'users/:id' => 'users#show'
  get 'users' => 'users#index'

  # get 'signup' => 'collectors#new'

  # error handling
  match '/404', via: :all, to: 'errors#not_found'
  match '/422', via: :all, to: 'errors#unprocessable_entity'
  match '/500', via: :all, to: 'errors#server_error'

  match '*path', via: :all, to: 'errors#not_found'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
