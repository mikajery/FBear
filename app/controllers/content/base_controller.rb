class Content::BaseController < ApplicationController
  layout 'content'
  helper Content::ContentHelper
  include TranslateHelper

  @@check_locale = true

  before_action :get_locale
  before_action :get_path

  class UnknownLocaleException < StandardError; end
  class PageNotFound < StandardError; end

  rescue_from UnknownLocaleException, :with => :not_found
  rescue_from PageNotFound, :with => :not_found

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

  def meta
    get_meta
  end

  protected 
    def get_item
      @current_page
    end

    def page_title_suffix
      ''
    end

    def page_title_prefix
      ''
    end

    def get_meta
      item = get_item

      if item.nil? 
        item = @current_page
      end

      if item
        title = []
        title << page_title_prefix.to_s if page_title_prefix
        title << item.title.to_s if item.title
        title << page_title_suffix.to_s if page_title_suffix

        {
          title: title.join(" "),
          heading: item.heading,
          keywords: item.keywords,
          description: item.description
        }
      else
        {}
      end
    end

    def get_path
      @current_page = nil
      Rails.application.routes.router.recognize(request) do |route, matches, param|
        page = ContentRouter.routes.each do |r| 
          if r[:as] == route.name 
            @current_page=r[:page] 
            break 
          end
        end
      end
    end

    def get_locale  
      if @@check_locale
        if cookies['_locale'].nil?
          redirect_to language_select_path
        end
      end

      if params[:_locale] or cookies['_locale']
        @language = Language.find_by_slug(params[:_locale] || cookies['_locale'])
      else
        @language = Language.find_by_is_default(true)
      end

      raise UnknownLocaleException unless @language

      I18n.locale = @language.slug
    end

    def render_error(status, exception)
      respond_to do |format|
        format.html { render template: "errors/error_#{status}", layout: 'errors', status: status }
        format.all { render nothing: true, status: status }
      end
    end
	
end