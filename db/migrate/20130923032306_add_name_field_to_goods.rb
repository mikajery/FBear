class AddNameFieldToGoods < ActiveRecord::Migration
  def change
  	add_column :goods, :name, :string
  end
end
