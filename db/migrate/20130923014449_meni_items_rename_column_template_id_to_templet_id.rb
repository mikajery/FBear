class MeniItemsRenameColumnTemplateIdToTempletId < ActiveRecord::Migration
  def change
    rename_column :menu_items, :template_id, :templet_id
  end
end
