class AddPriceToGoodOptionTranslations < ActiveRecord::Migration
  def change
    add_column :good_option_translations, :price, :integer
  end
end
