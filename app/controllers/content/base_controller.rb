class Content::BaseController < ApplicationController
  layout 'content'
  helper Content::ContentHelper

  before_action :get_locale
  before_action :get_path

  class UnknownLocaleException < StandardError
  end

  rescue_from UnknownLocaleException, :with => :not_found

  def not_found(exception)
    render_error 404, exception
  end

  def index
    render 'content/index', layout: "map"
  end

  def show
  end

  def item
  end

  def list
  end

  protected 
    def get_path
      Page.all.each do |page|
        page.routes.each do |r|
          if '/' + page.routed_url(r) == request.path + '/'
            @current_page = page
            break
          end
          # abort page.routed_url(r)
        end
      end
      # abort request.path
      # path = ActionController::Routing::Routes.recognize_path "/your/path/here/"
      # controller = path[:controller]
      # action = path[:action]
    end

    def get_locale
      if params[:_locale]
        @language = Language.find_by_slug params[:_locale]
      else
        @language = Language.find_by_is_default(true)
      end

      raise UnknownLocaleException unless @language
    end

    def render_error(status, exception)
      respond_to do |format|
        format.html { render template: "errors/error_#{status}", layout: 'errors', status: status }
        format.all { render nothing: true, status: status }
      end
    end
	
end