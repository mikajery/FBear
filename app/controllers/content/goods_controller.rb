class Content::GoodsController < Content::BaseController
  before_action :get_locale

  def item
    @good = Good.find_by_slug params[:slug]
    if @good.bg == 'dark'
      @body_dark = true
    end

    unless @good.no_shadow
      @body_no_shadow = true
    end
  end

  def get_item
    @good
  end

end
