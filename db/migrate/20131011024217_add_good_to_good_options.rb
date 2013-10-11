class AddGoodToGoodOptions < ActiveRecord::Migration
  def change
    add_reference :good_options, :good, index: true
  end
end
