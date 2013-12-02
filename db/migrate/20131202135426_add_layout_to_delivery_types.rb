class AddLayoutToDeliveryTypes < ActiveRecord::Migration
  def change
    add_column :delivery_types, :layout, :string, null: false, default: 'no_address'
  end
end
