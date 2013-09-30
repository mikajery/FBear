class PageType < ActiveRecord::Base

  def routes url
    if method == 'simple'
      simple_routes url
    else method == 'items'
      items_routes url
    end
  end

  private 
    def simple_routes url
      [{route: '', action: :index}]
    end

    def items_routes url
      [
        {route: '',      action: :index},
        {route: ':slug', action: :item, as: url + '_item'}
      ]
    end
end