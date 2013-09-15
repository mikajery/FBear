class DesignerLang < ActiveRecord::Base
  belongs_to :designer
  belongs_to :language

  validates_uniqueness_of :language, :scope => :designer
end
