class Menu < ActiveRecord::Base
  include Languageable

  validates_uniqueness_of :key, :scope => :language
  validates_presence_of :language
  
end
