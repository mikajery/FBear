class Content::BaseController < ApplicationController
  layout 'content'
  helper Content::ContentHelper

  def index
  end

  def item
  end

  def list
  end


  protected 
    def render_error(status, exception)
      respond_to do |format|
        format.html { render template: "errors/error_#{status}", layout: 'errors', status: status }
        format.all { render nothing: true, status: status }
      end
    end
	
end