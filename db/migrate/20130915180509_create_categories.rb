class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references :category, index: true
      t.string :slug
      t.string :type

      t.timestamps
    end
  end
end
