class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.references :menu, index: true
      t.references :template, index: true
      t.references :language, index: true
      t.string :url

      t.timestamps
    end
  end
end
