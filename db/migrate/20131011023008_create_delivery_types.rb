class CreateDeliveryTypes < ActiveRecord::Migration
  def change
    create_table :delivery_types do |t|
      t.string :name
      t.string :key

      t.timestamps
    end
  end
end
