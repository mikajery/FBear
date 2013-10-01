class Content::DesignersController < Content::BaseController
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
