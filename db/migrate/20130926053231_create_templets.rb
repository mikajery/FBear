class CreateTemplets < ActiveRecord::Migration
  def change
    create_table :templets do |t|
      t.string :name
      t.string :src

      t.timestamps
    end
  end
end
