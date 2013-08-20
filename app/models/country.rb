class Country < ActiveRecord::Base
	has_and_belongs_to_many :languages, :autosave => true

end
