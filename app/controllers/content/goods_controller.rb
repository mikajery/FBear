class Content::GoodsController < Content::BaseController
  before_action :get_locale
  before_action :navigation, only: [:item]

  def item
    @good = Good.find_by_slug params[:slug]
    if @good.bg == 'dark'
      @body_dark = true
    end
  end

  def get_item
    @good
  end

  private
    def navigation
      links = []

      GoodCategory.all.each do |i|
        links << { active: (true if @category == i), href: catalog_item_path(i.slug), title: i.title }
      end

      @navigation = {
        helper: t('navigation.catalog.helper'),
        title: t('navigation.catalog.title'),
        items: links
      }
    end  
end
