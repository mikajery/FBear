class AlterCategories < ActiveRecord::Migration
	def self.up
    rename_column :categories, :type, :key
  end
end
