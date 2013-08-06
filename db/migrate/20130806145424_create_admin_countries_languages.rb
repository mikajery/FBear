class CreateAdminCountriesLanguages < ActiveRecord::Migration
  def change
    create_table :admin_countries_languages, id: false do |t|
      t.integer :country_id
      t.integer :language_id
    end
  end
end
