class Page < ActiveRecord::Base
  include MultilingualModel
  include AutotitleableModel
  
  translates :title, :heading, :keywords, :description, :content

  belongs_to :templet
  validates :name, presence: true
end
