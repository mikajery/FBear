CMS::Application.routes.draw do

  get "search/search"
  get "materials/show"

  get "search" => 'search#search', as: :search

  scope '/cart' do
    post controller: :cart, action: :buy, as: :cart_buy
    post 'order' => 'cart#order', as: :cart_order

    delete controller: :cart, action: :remove_good, as: :cart_remove
    get controller: :cart, action: :show, as: :cart
    get 'info' => 'cart#info', as: :cart_info
    get 'done' => 'cart#done', as: :cart_ordered
  end

  get '/admin' => 'admin/welcome#index'

  namespace :admin do
    get '' => 'welcome#index', as: 'root'

    resources :menus

    resources :good_categories, path: 'catalog' do
      get 'items', on: :member, action: :index, as: :items
      get ':locale', on: :member, action: :edit, as: 'languaged'
    end

    resources :post_categories, path: 'blogs' do
      get 'items', on: :member, action: :index, as: :items
      get ':locale', on: :member, action: :edit, as: 'languaged'
    end

    resources :menus do
      resources :menu_items
    end

    resources :designers, :languages, :pages, :posts, :tags, :settings, :materials, :pdfs, :three60s, :translations do
      get ':locale', on: :member, action: :edit, as: 'languaged'
    end

    resources :menu_items do
      get ':locale', on: :member, action: :edit, as: 'languaged'
      post 'order', on: :collection, as: 'order'
    end

    resources :good_options do
      get ':locale', on: :member, action: :edit, as: 'languaged'
      post 'order', on: :collection, as: 'order'
    end

    resources :goods do
      resources :pdfs, only: [:new, :create]
      resources :good_options, only: [:new, :create]
      resources :three60s, only: [:new, :create]

      post 'order', on: :collection, as: 'order'
      get ':locale', on: :member, action: :edit, as: 'languaged'
    end
  end

  LanguageRouter.reload
  LanguageRouter.routes.each do |r|
    get r
  end

  ContentRouter.reload
  ContentRouter.routes.each do |r|
    get r.except(:page)
  end

end
