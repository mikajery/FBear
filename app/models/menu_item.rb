class MenuItem < ActiveRecord::Base
  include MultilingualModel
  translates :title

  belongs_to :page
  validates :name, presence: true
end
