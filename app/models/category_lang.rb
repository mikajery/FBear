class CategoryLang < ActiveRecord::Base
  belongs_to :category
  belongs_to :language

  validates_uniqueness_of :language, :scope => :category
end
