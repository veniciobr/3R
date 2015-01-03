Rnarrails::Application.routes.draw do

  get "dashboard/index"
  get "static_pages/help"
  resources :projects

  get "user/login"
  
#  devise_for :users
  devise_for :users #, :controllers => {:registrations => "registrations"}

  get "home/index"
  get "demo/index"
  get "users/login"

  #get "home/demo", to: 'demo#show_image'
  #match '/:controller/:action', :via => [:get, :post]

  root to: 'home#index' 

  resources :demo do
      collection do
        get :show_image
      end
  end

  devise_scope :user do
     get "sign_in", :to => "devise/sessions#new"
     get "sign_out", :to => "devise/sessions#destroy"
     get "sign_up", :to => "devise/registrations#new"
     get "edit", :to => "devise/registrations#edit"
 end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
