class Content::GoodsController < Content::BaseController
  before_action :get_locale

  def item
    @good = Good.find_by_slug params[:slug]
    if @good.bg == 'dark'
      @body_dark = true
    end
  end

  def get_item
    @good
  end

end
