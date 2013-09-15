class CreateMenuItemLangs < ActiveRecord::Migration
  def change
    create_table :menu_item_langs do |t|
      t.references :menu_item, index: true
      t.references :language, index: true
      t.string :title
      t.string :heading
      t.text :meta_keywords
      t.text :meta_description

      t.timestamps
    end
  end
end
