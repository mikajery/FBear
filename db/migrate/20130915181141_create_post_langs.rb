class CreatePostLangs < ActiveRecord::Migration
  def change
    create_table :post_langs do |t|
      t.references :post, index: true
      t.references :language, index: true
      t.text :content
      t.string :meta_title
      t.text :meta_keywords
      t.text :meta_description

      t.timestamps
    end
  end
end
