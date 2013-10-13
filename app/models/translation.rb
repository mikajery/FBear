class Translation < ActiveRecord::Base
  include MultilingualModel
  translates :value
end
