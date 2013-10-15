CMS::Application.routes.draw do

  get "search/search"
  get "materials/show"

  get "search" => 'search#search', as: :search

  scope '/cart' do
    post 'buy' => 'cart#buy', as: :cart_buy
    post 'update' => 'cart#update', as: :cart_update

    delete controller: :cart, action: :remove_good, as: :cart_remove
    get controller: :cart, action: :show, as: :cart

    scope '/order' do
      get '' => 'order#show', as: :order_show
      post 'finish' => 'order#finish', as: :order_finish
      get 'done' => 'order#done', as: :order_done
    end
  end

  get '/admin' => 'admin/welcome#index'

  namespace :admin do
    get '' => 'welcome#index', as: 'root'

    resources :menus

    resources :good_categories, path: 'catalog' do
      get 'items', on: :member, action: :index, as: :items
      get ':locale', on: :member, action: :edit, as: 'languaged'
    end

    resources :property_types do
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

    resources :designers, :properties, :languages, :pages, :posts, :tags, :settings, :materials, :translations do
      get ':locale', on: :member, action: :edit, as: 'languaged'
    end

    resources :menu_items, :three60s, :pdfs, :variants do
      get ':locale', on: :member, action: :edit, as: 'languaged'
      post 'order', on: :collection, as: 'order'
    end

    resources :goods do
      resources :pdfs, only: [:new, :create]
      resources :three60s, only: [:new, :create]
      resources :variants, only: [:new, :create]

      post 'order', on: :collection, as: 'order'
      get ':locale', on: :member, action: :edit, as: 'languaged'
    end
  end

  LanguageRouter.reload
  unless LanguageRouter.empty?
    LanguageRouter.routes.each do |r|
      get r
    end
  end

  ContentRouter.reload
  unless ContentRouter.routes.empty?
    ContentRouter.routes.each do |r|
      get r.except(:page)
    end
  end
end
