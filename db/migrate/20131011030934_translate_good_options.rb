class TranslateGoodOptions < ActiveRecord::Migration
  def up
    GoodOption.create_translation_table!({
      :name => :string
    }, {
      :migrate_data => true
    })
  end

  def down
    GoodOption.drop_translation_table! :migrate_data => true
  end
end
