class Good < ActiveRecord::Base
	include Multilingual
	has_many :good_langs

	def langs
		self.good_langs
	end

	def unused_langs
		langs = []
		self.langs.each do |gl|
			langs << gl.language
		end

		Language.all - langs
	end
end
