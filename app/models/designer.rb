class Designer < ActiveRecord::Base
  include MultilingualModel
  include AutotitleableModel

  translates :title, :heading, :keywords, :description, :content, :motto

  has_and_belongs_to_many :goods
  validates :name, presence: true

  attr_accessor :avatar

  validates :avatar, :attachment_presence => true
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png','image/gif']

  has_attached_file :avatar, 
    styles: {preview: "300x300#", admin: "30x30#"},
    default_url: "/images/:style/missing.png",
    url: "/uploads/designers/:id/logo/:style/:basename.:extension",
    path: ":rails_root/public/uploads/designers/:id/logo/:style/:basename.:extension"
end
