class Panorama < MediaFile  
  belongs_to :good

  attr_accessor :src

  validates :src, :attachment_presence => true
  validates_attachment_content_type :src, :content_type => ['image/jpeg', 'image/png','image/gif']

  has_attached_file :src, 
    styles: {preview: "300x300#", admin: "30x30#"},
    default_url: "/images/:style/missing.png",
    url: "/uploads/good/:id/panorama/:style/:basename.:extension",
    path: ":rails_root/public/uploads/good/:id/panorama/:style/:basename.:extension"

  def url size
    src size
  end

end
