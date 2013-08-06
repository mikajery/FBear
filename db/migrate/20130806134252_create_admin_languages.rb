class CreateAdminLanguages < ActiveRecord::Migration
  def change
    create_table :admin_languages do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
