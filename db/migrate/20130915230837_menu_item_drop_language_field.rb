class MenuItemDropLanguageField < ActiveRecord::Migration
  def change
    remove_column :menu_items, :language_id
  end
end
