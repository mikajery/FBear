class Setting < ActiveRecord::Base
  include SortedByName  
  include MultilingualModel

  translates :value
  validates  :key, presence: true
end
