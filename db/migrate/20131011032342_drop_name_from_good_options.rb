class DropNameFromGoodOptions < ActiveRecord::Migration
  def change
    remove_column :good_options, :name
  end
end
