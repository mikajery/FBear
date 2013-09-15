class CreateSettingLangs < ActiveRecord::Migration
  def change
    create_table :setting_langs do |t|
      t.references :language, index: true
      t.references :setting, index: true
      t.text :value

      t.timestamps
    end
  end
end
