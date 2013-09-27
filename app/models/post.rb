class Post < ActiveRecord::Base
  include MultilingualModel
  include AutotitleableModel
  include SluggableModel
  
  translates :title, :heading, :keywords, :description, :content

  belongs_to :post_category
  validates :name, presence: true
  validates :post_category, presence: true

  attr_accessor :picture

  validates :picture, :attachment_presence => true
  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png','image/gif']

  has_attached_file :picture, 
    styles: {admin: "30x30#", preview: "400x400#"},
    default_url: "/images/:style/missing.png",
    url: "/uploads/blogs/:id/:style/:basename.:extension",
    path: ":rails_root/public/uploads/blogs/:id/:style/:basename.:extension"

  def category
    post_category
  end
end
