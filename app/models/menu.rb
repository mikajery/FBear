class Menu < ActiveRecord::Base
  include Languageable

  has_many :menu_items

  validates_uniqueness_of :key, :scope => :language
  validates_presence_of :language

  def items
  	self.menu_items
  end
  
end
