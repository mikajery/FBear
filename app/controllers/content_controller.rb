class ContentController < Content::BaseController
	layout 'content'

	rescue_from Exception, with: lambda { |exception| render_error 404, exception }

	def show
		@page = MenuItem.find_by(url: params[:url])

		if !@page
			throw 'aaa'
		end
	end

	private 
	def render_error(status, exception)
    respond_to do |format|
      format.html { render template: "errors/error_#{status}", layout: 'errors', status: status }
      format.all { render nothing: true, status: status }
    end
  end
end
