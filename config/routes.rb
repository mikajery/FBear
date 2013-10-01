CMS::Application.routes.draw do
  root :to => 'content/content#index'

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

    resources :designers, :languages, :menu_items, :pages, :posts, :settings, :materials, :pdfs, :three60s do
      get ':locale', on: :member, action: :edit, as: 'languaged'
    end

    resources :goods do
      resources :pdfs, only: [:new, :create]
      resources :three60s, only: [:new, :create]
      get ':locale', on: :member, action: :edit, as: 'languaged'
    end
  end

  if ActiveRecord::Base.connection.table_exists? 'pages'
    Page.all.each do |page|
      page.routes.each do |r|
        options = {
          page.routed_url(r) => 'content/' + r[:controller].to_s + '#' + r[:action].to_s
        }
        options[:as] = r[:as].underscore if r[:as]
        get options
      end
    end
  end

  # Page.routes(':_locale').each do |r|
  #   get r[:route] => 'content#show',
  #       as: 'locale_' + r[:name].to_s,
  #       constraints: lambda{|req| Language.all.map{|a| a.slug}.include?(req.params[:_locale])}
  # end
end
