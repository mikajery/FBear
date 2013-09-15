class CreateDesigners < ActiveRecord::Migration
  def change
    create_table :designers do |t|
      t.string :photo

      t.timestamps
    end
  end
end
