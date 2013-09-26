class Good < ActiveRecord::Base
  include MultilingualModel

  translates :price, :title, :heading, :keywords, :description

  has_and_belongs_to_many :good_category

  validates :name, presence: true

  attr_accessor :picture
  attr_accessor :logo

  validates :logo, :attachment_presence => true
  validates :picture, :attachment_presence => true

  has_attached_file :logo, 
    styles: {preview: "300x300#"},
      default_url: "/images/:style/missing.png",
      url: "/uploads/good/:id/logo/:style/:basename.:extension",
      path: ":rails_root/public/uploads/good/:id/logo/:style/:basename.:extension"

  has_attached_file :picture, 
      styles: {preview: "300x300#", admin: "30x30#"},
      default_url: "/images/:style/missing.png",
      url: "/uploads/good/:id/picture/:style/:basename.:extension",
      path: ":rails_root/public/uploads/good/:id/picture/:style/:basename.:extension"

end
