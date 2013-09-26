class Designer < ActiveRecord::Base
  include MultilingualModel
  translates :title, :heading, :keywords, :description, :content

  has_many :designer_goods

  validates :name, presence: true

end
