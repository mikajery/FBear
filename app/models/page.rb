class Page < ActiveRecord::Base
  include MultilingualModel
  include AutotitleableModel
  
  translates :title, :heading, :keywords, :description, :content

  belongs_to :templet
  validates :name, presence: true
  validates :url, presence: true

  def self.routes prefix=false
    routes = []
    all.each do |i|
      routes = routes + i.routes(prefix)
    end

    routes
  end

  def routes prefix
    routes = []

    if prefix
      prefix = [prefix]
    else
      prefix = []
    end

    if '/*' == url[-2, 2]
      prefix << url[0..-3]
    else
      prefix << url
      routes << { route: prefix.join('/'), name: templet.src }
    end


    
    params.each do |r|
      route = prefix + [r[:route]]
      name = [templet.src]
      name << r[:name] unless r[:name].nil?
      routes << { route: route.join('/'), name: name.join('_')  }
    end

    routes
  end

  def params
    case templet.src
    when 'blog'
      [{ route: ':slug'}, { name: 'show', route: ':slug/show/:id'} ]
    else 
      []
    end
  end
end
