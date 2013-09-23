class ContentController < Content::BaseController
	layout 'content'

	rescue_from Exception, with: lambda { |exception| render_error 404, exception }

	def show
		@page = MenuItem.find_by(url: params[:url])

		if !@page
			throw 'not found'
		end
	end
end
