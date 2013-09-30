class MenuItem < ActiveRecord::Base
  include MultilingualModel
  include AutotitleableModel
  
  translates :title

  belongs_to :page
  belongs_to :menu
  validates :name, presence: true

  def routes
    page.routes
  end
end
