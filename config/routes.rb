Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", session: "session"}
  resources :users
  resources :posts
  # You can have the root of your site routed with "root"
  root 'welcome#index'
  get 'welcome' => 'welcome#index', as: :welcome
  patch 'save_user' => 'welcome#save', as: :save_user
  post 'posts/new' => 'posts#new', as: :create_post

  devise_scope :user do
  get 'logout' => 'session#destroy', as: :logout
  end
  # Example of regular route:
#  delete 'delete/:id' => 'posts#destroy', as: :delete

  # Example of named route that can be invoked with purchase_url(id: product.id)
  post 'posts/create' => 'posts#create', as: :save_post
  get 'posts/update' => 'posts#create_again', as: :save_post_again

  get 'update' => 'posts#update', as: :update
  get 'user/edit' => 'users#edit', as: :edit_users
  get 'profile' => 'users#showtunes', as: :user1

  get 'save' => 'posts#create', as: :save_posts
  get 'posts/delete/(:id)' => 'posts#destroy', as: :delete
  get 'posts/edit/(:id)' => 'posts#edit', as: :edit
  get 'posts/(:id)/edit' => 'posts#edit', as: :edits

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
