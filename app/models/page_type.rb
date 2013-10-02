class PageType < ActiveRecord::Base

  def routes url
    if method == 'content'
      content_routes url
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
    def languages_select_routes url
      [{route: '', action: 'index', controller: 'language_select', as: 'language_select'}]
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
