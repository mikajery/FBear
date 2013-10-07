class MenuItem < ActiveRecord::Base
  include MultilingualModel
  include AutotitleableModel

  default_scope { order('weight') }
  
  translates :title

  belongs_to :page
  belongs_to :menu
  validates :name, presence: true

  def routes
    page.routes
  end

  def url
    page.url unless page.nil?
  end
  
  def path
    '/' + url
  end
end
