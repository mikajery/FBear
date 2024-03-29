class AddAttachmentLogoToGoods < ActiveRecord::Migration
  def self.up
    change_table :goods do |t|
      t.attachment :logo
    end
  end

  def self.down
    drop_attached_file :goods, :logo
  end
end
