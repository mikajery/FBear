class Content::CatalogsController < Content::BaseController
  before_action :get_locale
  before_action :navigation, only: [:list, :item]
  protect_from_forgery except: [:fetch]

  def list
    @items = Good.all.where('on_main is true')
  end

  def item
    @items = Good.all
    render 'list'
  end

  def fetch
    if fetch_params == 'all'
      @goods = Good.all
    elsif fetch_params == 'main'
      @goods = Good.all.where('on_main is true')
    else
      category = Category.find_by_slug fetch_params
      @goods = category.goods if category.present?
    end

    respond_to do |format|
      if @goods
        format.json { render action: 'fetch' }
      else
        format.json { head :no_content }
      end
    end
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

    def fetch_params
      params.require(:collection)
    end

    def navigation
      links = []

      links << { active: (true if all_items), href: '#all', title: T('Все товары') }

      if !all_items
        @category = GoodCategory.find_by_slug(params[:slug])
      end

      GoodCategory.all.each do |i|
        links << { active: (true if @category == i), href: "##{i.slug}", title: i.title }
      end

      @navigation = {
        helper: T("Категории"),
        title: T("Выберите категорию товара"),
        items: links
      }
    end  
end
