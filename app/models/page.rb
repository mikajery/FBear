class Page < ActiveRecord::Base
  include SortedByName
  include MultilingualModel
  include AutotitleableModel
  
  translates :title, :heading, :keywords, :description, :content
  belongs_to :page_type

  validates :name,      presence: true
  validates :url,       presence: true
  validates :page_type, presence: true

  def type
    page_type
  end

  def routes
    type.routes(url).map do |route|
      unless route[:controller]
        route.merge({controller: url.underscore.pluralize}) 
      else 
        route
      end
    end
  end

  def routed_url route
    path = [url]
    path << route[:route]

    path.join "/"
  end
end
