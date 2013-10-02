class Content::LanguageController < ApplicationController
  def select
    cookies['_locale'] = params[:slug]
    redirect_to request.referer
  end
end