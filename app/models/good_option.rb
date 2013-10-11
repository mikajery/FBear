class GoodOption < ActiveRecord::Base
  include MultilingualModel
  translates :name, :price
  
  belongs_to :good
end
