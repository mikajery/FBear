class CreateCategoryLangs < ActiveRecord::Migration
  def change
    create_table :category_langs do |t|
      t.references :category, index: true
      t.references :language, index: true
      t.string :name
      t.string :meta_title
      t.text :meta_keywords
      t.text :meta_description

      t.timestamps
    end
  end
end
