class Content::CatalogsController < Content::BaseController
  before_action :navigation, only: [:list, :item]

  def list
    @items = Good.all
  end

  def item
    @category = GoodCategory.find_by_slug(params[:slug])
    @items = @category.posts

    render 'list'
  end

  private
    def navigation
      items = []

      GoodCategory.all.each do |i|
        items << { active: false, href: blogs_item_path(i.slug), title: i.title }
      end

      @navigation = {
        helper: t('navigation.catalog.helper'),
        title: t('navigation.catalog.title'),
        items: items
      }
    end  
end
