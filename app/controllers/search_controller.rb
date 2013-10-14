class SearchController < Content::BaseController
  include ActionView::Helpers::TextHelper

  def search
    @query = params[:search].downcase
    @results = []

    Good.with_translations.where('lower(title) like ?', "%#{@query}%").each do |good|
      @results << { picture: good.thumb.url(:preview), 
                    title: good.title, 
                    location: 'Каталог', 
                    url: goods_item_path(good.slug), 
                    content: truncate(strip_tags(good.announce), length: 300)
                  }
    end
  end
end
