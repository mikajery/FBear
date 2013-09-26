class Post < ActiveRecord::Base
  include MultilingualModel
  translates :title, :heading, :keywords, :description, :content

  belongs_to :post_category
  validates :name, presence: true
end
