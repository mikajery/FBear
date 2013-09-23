module MenuItemsHelper
  def menu_items_path(menu)
  	menu_menu_items_path(menu)
  end

  def edit_menu_item_path(menu_item)
  	edit_menu_menu_item_path(menu_item, menu_id: @menu.id)
  end

  def menu_item_path(menu_item, menu = nil)
  	menu_menu_item_path(menu_item, menu_id: @menu.id)
  end

end
