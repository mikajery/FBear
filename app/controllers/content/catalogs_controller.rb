class Content::CatalogsController < Content::BaseController
  before_action :get_locale
  before_action :navigation, only: [:list, :item]

  def list
    @items = Good.all
  end

  def item
    @items = @category.goods 
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
    def navigation
      links = []

      if params[:slug]
        @category = GoodCategory.find_by_slug(params[:slug])
      end

      GoodCategory.all.each do |i|
        links << { active: (true if @category == i), href: catalog_item_path(i.slug), title: i.title }
      end

      links << { active: (true unless @category), href: catalog_path, title: T('Все товары') }
      
      @navigation = {
        helper: T("Категории"),
        title: T("Выберите категорию товара"),
        items: links
      }
    end  
end
