class ContentController < Content::BaseController
	layout 'content'

  before_action :get_locale, only: [:show]

	class UnknownLocaleException < StandardError
  end

  rescue_from UnknownLocaleException, :with => :not_found

  def not_found(exception)
    render_error 404, exception
  end

  def index
    render 'content/index'
  end

  def show
  end

  private 
    def get_locale
      if params[:_locale]
        @language = Language.find_by_slug params[:_locale]
      else
        @language = Language.find_by_is_default(true)
      end

      raise UnknownLocaleException unless @language
    end
end
