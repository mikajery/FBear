CMS::Application.routes.draw do
  get "landing/show"
  # admin routes
  namespace :admin do
    root :to => 'welcome#index'
  end

  scope '/admin' do
    resources :menus, :templets

    resources :post_categories, :good_categories do
      get 'items', on: :member, action: :index, as: :items
    end

    resources :menus do
      resources :menu_items
      # get 'items', on: :member, action: :index, as: :items
    end

    resources :post_categories, :good_categories, :designers, :goods, :languages, :menu_items, :pages, :posts, :settings, :materials do
      get ':locale', on: :member, action: :edit, as: 'languaged'
    end
  end

  get 'landing' => 'landing#show'

  # static routes for markup
  get 'html/index'   => 'html#index'
  get 'html/map'     => 'html#map'
  
  get 'html/landing' => 'html#landing'
  get 'html/catalog' => 'html#catalog'
  get 'html/good'    => 'html#good'

  get 'html/search'  => 'html#search'

  get 'html/order1'  => 'html#order1'
  get 'html/order2'  => 'html#order2'  
  get 'html/order3'  => 'html#order3'  

  get 'html/designer'   => 'html#designer'
  get 'html/designers'  => 'html#designers'

  get 'html/blog'    => 'html#blog'
  get 'html/blogs'   => 'html#blogs'

  # get '*url' => 'content#show', format: false
end
