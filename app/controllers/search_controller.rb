class SearchController < Content::BaseController
  def search
    @query = params[:search]
    @results = []
  end
end
