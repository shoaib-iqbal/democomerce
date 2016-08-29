Rails.application.routes.draw do

  namespace :admin do
    resources :deal_of_days
  end
  devise_for :customers , :controllers => { :registrations => 'customers2' }
  resources :customers
  devise_for :vendor_admins
  namespace :admin do
    resources :users
    resources :products
    resources :colors
    resources :sizes
    resources :orders
    resources :store_settings
  end
  devise_for :users, :controllers => {:registrations => "registrations"}
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


 resources :carts
 resources :orders 
 resources :vendors
 resources :products, only: [:show, :index]
 resources :admin, only: [:index]
  # get 'delimg', to: 'admin_products#delimg' , as: :delimgpath
  match "home/set_session" ,to: "home#change_languages", as: "languagepath", via: [:get]
  match "admin/get_color_and_size" ,to: "admin/products#get_size_and_color_of_product", as: "getsizecolor", via: [:get]
  root 'home#index'
  
  match "line_items/changequantity", to: "line_items#adjust_quantity", as: "changequantity", via: [:get]
  match "checkout", to: "orders#checkout", as: "checkout", via: [:get]
  match "checkout/details", to: "orders#details", as: "checkout_details", via: [:get, :patch, :post]
  match "checkout/confirmationpage", to: "orders#confirmation_page", as: "confirmation_message", via: [:get, :patch, :post]
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
