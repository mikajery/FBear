class AlterMenus < ActiveRecord::Migration
  def change
    rename_column :menus, :type, :key
  end
end
