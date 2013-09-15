class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.references :language, index: true
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
