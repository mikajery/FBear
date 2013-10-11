class Content::BlogsController < Content::BaseController
  before_action :get_locale
  before_action :navigation, only: [:list, :item]

  def list
    @items = Post.all
  end

  def item
    @items = @category.posts
    render 'list'
  end

  def get_item
    @category
  end

  def page_title_prefix
    if @category
      'Блоги:'
    end
  end

  private
    def navigation
      items = []

      if params[:slug]
        @category = PostCategory.find_by_slug(params[:slug])
      end

      PostCategory.all.each do |i|
        items << { active: (true if @category == i), href: blogs_item_path(i.slug), title: i.title }
      end

      items << { active: (true unless @category), href: blogs_path, title: 'Все записи' }

      @navigation = {
        helper: t('navigation.blogs.helper'),
        title: t('navigation.blogs.title'),
        items: items
      }
    end
end
