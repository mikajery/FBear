class Language < ActiveRecord::Base
  include MultilingualModel
  include SluggableModel
  include AutotitleableModel

  translates :title
  validates :name, presence: true
end
