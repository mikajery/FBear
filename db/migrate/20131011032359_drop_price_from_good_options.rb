class DropPriceFromGoodOptions < ActiveRecord::Migration
  def change
    remove_column :good_options, :price
  end
end
