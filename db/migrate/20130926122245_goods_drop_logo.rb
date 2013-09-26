class GoodsDropLogo < ActiveRecord::Migration
  def change
    drop_column :goods, :logo
  end
end
