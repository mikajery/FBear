CMS::Application.routes.draw do
  # root :to => 'content/content#index'

  get '/admin' => 'admin/welcome#index'

  namespace :admin do
    # root :to => 'welcome#index', as: 'admin_root'
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

    resources :designers, :languages, :menu_items, :pages, :posts, :tags, :settings, :materials, :pdfs, :three60s do
      get ':locale', on: :member, action: :edit, as: 'languaged'
    end

    resources :goods do
      resources :pdfs, only: [:new, :create]
      resources :three60s, only: [:new, :create]
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


  #   def self.content_routes
  #     if _content_routes.nil?
  #       _content_routes = []
        
  #     end

  #     _content_routes
  #   end

  #   private 
  #     _content_routes = nil

  # CMS::Application.content_routes.each do |r|
  #   get r
  # end

  # Page.routes(':_locale').each do |r|
  #   get r[:route] => 'content#show',
  #       as: 'locale_' + r[:name].to_s,
  #       constraints: lambda{|req| Language.all.map{|a| a.slug}.include?(req.params[:_locale])}
  # end
end
