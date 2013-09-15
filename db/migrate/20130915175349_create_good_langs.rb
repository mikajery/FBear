class CreateGoodLangs < ActiveRecord::Migration
  def change
    create_table :good_langs do |t|
      t.references :good, index: true
      t.references :language, index: true
      t.string :slug
      t.string :name
      t.string :logo
      t.integer :price
      t.text :description
      t.string :meta_title
      t.text :meta_keywords
      t.text :meta_description

      t.timestamps
    end
  end
end
