class Content::CatalogsController < Content::BaseController
  before_action :get_locale
  before_action :navigation, only: [:list, :item]

  def list
    @items = Good.all.where('on_main is true')
  end

  def item
    if params[:slug] && params[:slug] == 'all'
      @items = Good.all
    else
      @items = @category.goods 
    end

    render 'list'
  end

  def get_item
    @category
  end

  def page_title_prefix
    if @category
      'Каталог:'
    end
  end

  private
    def all_items
      params[:slug] && params[:slug] == 'all'
    end

    def navigation
      links = []

      if !all_items
        @category = GoodCategory.find_by_slug(params[:slug])
      end

      GoodCategory.all.each do |i|
        links << { active: (true if @category == i), href: catalog_item_path(i.slug), title: i.title }
      end

      links << { active: (true if all_items), href: catalog_item_path('all'), title: T('Все товары') }
      
      @navigation = {
        helper: T("Категории"),
        title: T("Выберите категорию товара"),
        items: links
      }
    end  
end
