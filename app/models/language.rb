class Language < ActiveRecord::Base
	validates_uniqueness_of :slug
end
