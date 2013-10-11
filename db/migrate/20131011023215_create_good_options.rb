class CreateGoodOptions < ActiveRecord::Migration
  def change
    create_table :good_options do |t|
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end
