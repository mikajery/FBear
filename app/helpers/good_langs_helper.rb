module GoodLangsHelper
	def good_langs_path(good = false)
		good_good_langs_path(good)
	end	

	def edit_good_lang_path(gl)
		edit_good_good_lang_path(@good, gl)
	end

	def good_lang_path(gl, *args)
		good_good_lang_path(gl.good.id, gl.id)
	end
end
