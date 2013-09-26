class Language < ActiveRecord::Base
  include MultilingualModel
  translates :title

  validates :name, presence: true
end
