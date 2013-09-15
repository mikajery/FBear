class Menu < ActiveRecord::Base
  module Languageable

  validates_uniqueness_of :key, :scope => :language
end
