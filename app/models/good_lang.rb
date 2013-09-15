class GoodLang < ActiveRecord::Base
  belongs_to :good
  belongs_to :language

  validates_uniqueness_of :good, :scope => :language
end
