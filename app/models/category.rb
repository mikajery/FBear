class Category < ActiveRecord::Base  
  include MultilingualModel
  include SluggableModel
  include AutotitleableModel
  
  translates :title, :heading, :keywords, :description

  validates :type, presence: true
  validates :name, presence: true

  belongs_to :parent

  
end
