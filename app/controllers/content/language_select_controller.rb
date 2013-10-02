class Content::LanguageSelectController < Content::BaseController
  layout 'map'  
  @@check_locale = false
  
  def index
    render 'content/index'
  end
end