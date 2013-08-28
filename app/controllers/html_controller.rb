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
    @navigation = self.getCatalogNavigation
    @promo      = self.getCatalogPromo
    @items      = self.getCatalogItems
  end  

  def catalog
    @navigation = self.getCatalogNavigation
    @items      = self.getCatalogItems
  end

  def blogs
    @navigation = self.getBlogsNavigation
    @items      = self.getBlogsItems
  end

  def search
    @results = self.getSearchResults
  end
end
