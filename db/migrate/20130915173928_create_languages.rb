class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :slug
      t.string :name
      t.string :abbr

      t.timestamps
    end
  end
end
