class Content::LanguageController < ApplicationController
  def select
    cookies['_locale'] = params[:slug]
    if request.referer
      url = request.referer
      if URI(request.referer).path == '/language'
        url = '/'
      end
    else
      url = '/'
    end
    redirect_to url
  end
end