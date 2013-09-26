class Category < ActiveRecord::Base  
  include MultilingualModel
  translates :title, :heading, :keywords, :description

  validates :type, presence: true
  validates :name, presence: true

  belongs_to :parent

  
end
