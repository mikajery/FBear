class DropTemplatesTable < ActiveRecord::Migration
  def change
  	drop_table :templates
  end
end
