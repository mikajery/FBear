class Page < ActiveRecord::Base
  include SortedByName
  include MultilingualModel
  include AutotitleableModel
  
  translates :title, :heading, :keywords, :description, :content
  belongs_to :page_type

  validates :name,      presence: true
  validates :page_type, presence: true
  validates_uniqueness_of :url, :scope => :page_type_id

  def type
    page_type
  end

  def routes
    unless type.nil?
      _url = url

      if _url == '' and !route.nil? and route != ''
        _url = route.to_s
      end

      type.routes(_url).map do |route|
        unless route[:controller]
          route.merge({controller: _url.underscore.pluralize}) 
        else 
          route
        end
      end
    else
      []
    end
  end

  def routed_url r
    path = [url]
    path << r[:route]

    path.select{|a| !a.empty?}.join "/"
  end
end
