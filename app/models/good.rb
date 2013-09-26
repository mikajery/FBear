class Good < ActiveRecord::Base
  include MultilingualModel
  translates :title, :heading, :keywords, :description

  has_and_belongs_to_many :good_category

  validates :name, presence: true
  validates :logo, presence: true
end
