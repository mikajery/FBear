# todo краткое описание класса
# todo как происходит поиск?
class SearchController < Content::BaseController
  include ActionView::Helpers::TextHelper

  def search
    @query = params[:q].downcase
    @results = []

    unless @query.empty?
      Good.with_translations.where('lower(title) like ?', "%#{@query}%").each do |good|
        @results << { picture: good.thumb.url(:preview),
                      title: good.title,
                      location: 'Каталог',
                      url: goods_item_path(good.slug),
                      content: good.announce
                    }
      end
    end
  end
end
