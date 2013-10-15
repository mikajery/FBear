class Content::LanguageSelectController < Content::BaseController
  layout 'map' 

  before_action :get_locale, except: [:index] 
  
  def index
    render 'content/index'
  end
end