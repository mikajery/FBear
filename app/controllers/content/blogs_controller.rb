# todo краткое описание класса
class Content::BlogsController < Content::BaseController
  before_action :get_locale
  before_action :navigation, only: [:list, :item]
  protect_from_forgery except: [:fetch]

  def list
    @items = Post.all
  end

  def item
    @items = @category.posts
    render 'list'
  end

  def fetch
    if fetch_params == 'all'
      @posts = Post.all
    else
      category = Category.find_by_slug fetch_params
      @posts = category.posts if category.present?
    end

    respond_to do |format|
      if @posts
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
    # hardcode?
    if @category
      'Блоги:'
    end
  end

  private
    def fetch_params
      params.require(:collection)
    end

    def navigation
      items = []

      items << { href: '#all', title: 'Все записи' }

      PostCategory.all.each do |i|
        items << { href: "##{i.slug}", title: i.title }
      end

      @navigation = {
        fixed: true,
        helper: T("Тэги"),
        title: T("Выберите категорию блога"),
        items: items
      }
    end
end
