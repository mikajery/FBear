CMS::Application.routes.draw do
  get "content/show"
  root :to => 'content#show'

  get '/admin' => 'admin/welcome#index'

  scope '/admin' do
    # root :to => 'welcome#index', as: 'admin_root'
    get '' => 'welcome#index', as: 'admin_root'

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
      # get 'items', on: :member, action: :index, as: :items
    end

    resources :designers, :goods, :languages, :menu_items, :pages, :posts, :settings, :materials do
      get ':locale', on: :member, action: :edit, as: 'languaged'
    end

    resources :pdfs do
      get ':locale', on: :member, action: :edit, as: 'languaged'
    end

    resources :three60s do
      get ':locale', on: :member, action: :edit, as: 'languaged'
    end

    resources :goods do
      resources :pdfs
      resources :three60s, only: [:new, :create]
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

  # routes = []
  Page.all.each do |page|
    page.routes.each do |r|
      options = {
        page.routed_url(r) => 'content/' + r[:controller].to_s + '#' + r[:action].to_s
      }
      options[:as] = r[:as] if r[:as]
      get options
    end
  end

  # Page.routes(':_locale').each do |r|
  #   get r[:route] => 'content#show',
  #       as: 'locale_' + r[:name].to_s,
  #       constraints: lambda{|req| Language.all.map{|a| a.slug}.include?(req.params[:_locale])}
  # end
end
