class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :post, index: true
      t.references :comment, index: true
      t.references :language, index: true
      t.string :author
      t.string :email
      t.string :content

      t.timestamps
    end
  end
end
