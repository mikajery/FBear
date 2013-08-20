class HtmlController < Content::BaseController
  layout 'content'


  def index
  end

  def map
  	render layout: "map"
  end

  def landing

  end  

  def catalog
  end    
end
