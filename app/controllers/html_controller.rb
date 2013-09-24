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
    @absolute_footer = true
  end  

  def catalog
    @navigation = self.getCatalogNavigation
    @items      = self.getCatalogItems
    @absolute_footer = true
  end

  def good
    @body_dark = true
  end

  def blogs
    @navigation = self.getBlogsNavigation
    @items      = self.getBlogsItems
  end

  def blog
    @navigation = self.getBlogsNavigation
    @blog       = self.getBlogsItems.first
  end

  def search
    @results = self.getSearchResults
  end
end
