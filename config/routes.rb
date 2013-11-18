CMS::Application.routes.draw do

  mount RedactorRails::Engine => '/redactor_rails'
  scope "(:locale)", locale: ContentRouter.locales do
    get "search/search"
    post "catalog/fetch" => "content/catalogs#fetch", as: :catalog_fetch
    post "blogs/fetch" => "content/blogs#fetch", as: :blog_fetch
  end

  scope "(:locale)", locale: ContentRouter.locales do
    get "search" => 'search#search', as: :search
  end

  scope '(:locale)/cart', locale: ContentRouter.locales do
    post 'buy' => 'content/carts#buy', as: :cart_buy
    post 'update' => 'content/carts#update', as: :cart_update

    delete controller: 'content/carts', action: :remove_good, as: :cart_remove

    scope '/preorder' do
      #get '' => 'order#show', as: :order_show
      patch '' => 'content/order#finish', as: :order_finish
      #get 'done' => 'order#done', as: :order_done
    end
  end

  get '/admin' => 'admin/welcome#index'
  get '/cm' => 'cm/welcome#index', as: :cm_root

  namespace :cm do
    resources :post_categories, path: 'blogs' do
      get 'items', on: :member, action: :index, as: :items
      get ':locale', on: :member, action: :edit, as: 'languaged'
      post 'order', on: :collection, as: 'order'
    end

    resources :posts do
      resources :blocks, controller: 'post_blocks' do
        get ':locale', on: :member, action: :edit, as: :languaged
        post 'order', on: :collection, as: 'order'
      end

      post 'order', on: :collection, as: 'order'
      get ':locale', on: :member, action: :edit, as: :languaged
    end
  end

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

    resources :menus do
      resources :menu_items
    end

    resources :properties, :languages, :pages,  :tags, :settings, :translations do
      get ':locale', on: :member, action: :edit, as: 'languaged'
    end

    resources :menu_items, :three60s, :pdfs, :variants, :materials, :designers do
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
  unless LanguageRouter.routes.nil?
    LanguageRouter.routes.each do |r|
      get r
    end
  end

  ContentRouter.reload
  unless ContentRouter.routes.nil?
    scope "(:locale)", locale: ContentRouter.locales do
      ContentRouter.routes.each do |r|
        get r.except(:page, :applies_to, :active)
      end
    end
  end
end
