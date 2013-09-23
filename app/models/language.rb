class Language < ActiveRecord::Base
	validates_uniqueness_of :slug

	def full_name
		name + (' [' + slug + ']' if slug).to_s
	end
end
