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
