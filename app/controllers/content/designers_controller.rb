# todo краткое описание класса
class Content::DesignersController < Content::BaseController
  before_action :get_locale
  
  def list
    @designers = Designer.all
  end

  def item
    @designer = Designer.find(params[:slug])
  end

  def get_item
    @designer
  end
end
