class CategoryGood < ActiveRecord::Base
  belongs_to :category
  belongs_to :good
end
