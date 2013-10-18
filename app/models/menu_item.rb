class MenuItem < ActiveRecord::Base
  include MultilingualModel
  include AutotitleableModel

  default_scope { order('weight') }
  
  translates :title

  belongs_to :page
  belongs_to :menu
  has_many :menu_items
  belongs_to :menu_item

  validates :name, presence: true

  def items
    menu_items
  end

  def routes
    page.routes
  end

  def url
    page.url unless page.nil?
  end

  def path
    unless page.nil?
      page.routes.first[:as] + '_path'      
    end
  end
end
