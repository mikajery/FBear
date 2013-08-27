class HtmlController < Content::BaseController
  layout 'content'

  def index
  end

  def map
  	render layout: "map"
  end

  def order1
    @items = self.getCartItems
  end

  def order3
    @items = self.getCartItems
  end

  def designer
    @designer   = self.getDesigners.first
  end 

  def designers
    @designers  = self.getDesigners[1..-1]
  end 

  def landing
    @navigation = self.getNavigation
    @promo      = self.getPromo
    @items      = self.getItems
  end  

  def catalog
    @navigation = self.getNavigation
    @items      = self.getItems
  end

  def search
    @results = self.getResults
  end
end
