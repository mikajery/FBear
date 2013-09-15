class PostLang < ActiveRecord::Base
  belongs_to :post
  belongs_to :language

  validates_uniqueness_of :post, :scope => :language
end
