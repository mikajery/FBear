class RemoveNameFromPdfs < ActiveRecord::Migration
  def change
    remove_column :pdfs, :name
  end
end
