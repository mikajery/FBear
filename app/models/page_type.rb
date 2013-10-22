class PageType < ActiveRecord::Base

  def routes url
    if method == 'content'
      content_routes url
    elsif method == 'order'
      order_routes url
    elsif method == 'order_done'
      order_done_routes url
    elsif method == 'cart'
      cart_routes url
    elsif method == 'languages_select'
      languages_select_routes url
    elsif method == 'list_with_items'
      list_with_items_routes url
    elsif method == 'list'
      list_routes url      
    else method == 'item'
      item_routes url
    end
  end

  private
    def order_routes url
      [
        {route: '', action: 'show', controller: 'order', as: 'order_show', applies_to: ['order_finish']},
      ]
    end

    def order_done_routes url
      [
        {route: '', action: 'show', controller: 'order_done', as: 'order_done'},
      ]
    end

    def languages_select_routes url
      [{route: '', action: 'index', controller: 'language_select', as: 'language_select'}]
    end

    def cart_routes url
      [{route: '', action: 'index', controller: 'carts', as: 'cart'}]
    end

    def content_routes url
      [{route: '', action: 'show', controller: 'content', as: url}]
    end

    def list_with_items_routes url
      [
        {route: '',      action: 'list', as: url},
        {route: ':slug', action: 'item', as: url + '_item'}
      ]
    end

    def list_routes url
      [{route: '', action: 'list', as: url}]
    end

    def item_routes url
      [
        {route: ':slug', action: 'item', as: url + '_item'}
      ]
    end
end
