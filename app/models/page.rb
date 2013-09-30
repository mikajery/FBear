class Page < ActiveRecord::Base
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
    type.routes url
  end

  def routed_url route
    path = [url]
    path << route[:route]

    path.join "/"
  end
end
