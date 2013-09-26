class Setting < ActiveRecord::Base
  include MultilingualModel
  translates :value

  validates :key, presence: true
end
