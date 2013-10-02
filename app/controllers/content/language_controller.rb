class Content::LanguageController < ApplicationController
  def select
    session['_locale'] = params[:slug]
    redirect_to request.referer
  end
end