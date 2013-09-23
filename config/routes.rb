CMS::Application.routes.draw do
  root :to => 'welcome#index'

  # admin routes
  namespace :admin do
    root :to => 'welcome#index'
  end

  scope '/admin' do
    resources :templets, :languages, :menus, :settings, :designers, :goods, :posts
  end

  #content cms
  # root :to => 'welcome#index'

  # static routes for markup
  get 'html/index'   => 'html#index'
  get 'html/map'     => 'html#map'
  
  get 'html/landing' => 'html#landing'
  get 'html/catalog' => 'html#catalog'

  get 'html/search'  => 'html#search'

  get 'html/order1'  => 'html#order1'
  get 'html/order2'  => 'html#order2'  
  get 'html/order3'  => 'html#order3'  

  get 'html/designer'   => 'html#designer'
  get 'html/designers'  => 'html#designers'

  get 'html/blog'    => 'html#blog'
  get 'html/blogs'   => 'html#blogs'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

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
