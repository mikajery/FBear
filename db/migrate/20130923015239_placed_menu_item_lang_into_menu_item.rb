class PlacedMenuItemLangIntoMenuItem < ActiveRecord::Migration
  def change
  	add_column :menu_items, :is_absolute, :boolean, default: false
  	add_column :menu_items, :title, :string
  	add_column :menu_items, :heading, :string
  	add_column :menu_items, :meta_keywords, :text
  	add_column :menu_items, :meta_description, :text
  end
end
