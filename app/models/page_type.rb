class PageType < ActiveRecord::Base

  def routes url
    if method == 'content'
      content_routes url
    elsif method == 'items'
      items_routes url
    else method == 'item'
      item_routes url
    end
  end

  private 
    def content_routes url
      [{route: '', action: :show, controller: 'content'}]
    end

    def items_routes url
      [
        {route: '',      action: :list},
        {route: ':slug', action: :item, as: url + '_item'}
      ]
    end

    def item_routes url
      [
        {route: ':slug', action: :item, as: url + '_item'}
      ]
    end
end
