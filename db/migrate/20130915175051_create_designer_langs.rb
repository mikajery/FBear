class CreateDesignerLangs < ActiveRecord::Migration
  def change
    create_table :designer_langs do |t|
      t.references :designer, index: true
      t.references :language, index: true
      t.string :name
      t.text :motto
      t.text :description

      t.timestamps
    end
  end
end
