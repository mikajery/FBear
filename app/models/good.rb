class Good < ActiveRecord::Base
  include SortedByName
  include MultilingualModel
  include SluggableModel
  include AutotitleableModel

  translates :price, :title, :heading, :keywords, :description, :announce, :content, :additional

  has_and_belongs_to_many :good_category
  has_and_belongs_to_many :designer
  has_and_belongs_to_many :material

  has_and_belongs_to_many :tags

  has_one :video
  has_many :pdfs

  has_many :three60s, -> { where media_file_id: nil}

  validates :name, presence: true
  validates :designer, presence: true

  attr_accessor :picture
  attr_accessor :logo
  attr_accessor :thumb
  attr_accessor :panorama

  validates_attachment_content_type :panorama, :content_type => ['image/jpeg', 'image/png','image/gif']

  validates :logo, :attachment_presence => true
  validates_attachment_content_type :logo, :content_type => ['image/jpeg', 'image/png','image/gif']

  validates :thumb, :attachment_presence => true
  validates_attachment_content_type :thumb, :content_type => ['image/jpeg', 'image/png','image/gif']

  validates :picture, :attachment_presence => true
  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png','image/gif']

  validates :portrait, :attachment_presence => true
  validates_attachment_content_type :portrait, :content_type => ['image/jpeg', 'image/png','image/gif']

  validates :landscape, :attachment_presence => true
  validates_attachment_content_type :landscape, :content_type => ['image/jpeg', 'image/png','image/gif']

  has_attached_file :logo, 
    styles: {preview: "300x300#"},
    default_url: "/images/:style/missing.png",
    url: "/uploads/goods/:id/logo/:style/:basename.:extension",
    path: ":rails_root/public/uploads/goods/:id/logo/:style/:basename.:extension"

  has_attached_file :thumb, 
    styles: {preview: "300x300#", admin: "30x30#"},
    default_url: "/images/:style/missing.png",
    url: "/uploads/goods/:id/thumb/:style/:basename.:extension",
    path: ":rails_root/public/uploads/goods/:id/thumb/:style/:basename.:extension"

  has_attached_file :portrait, 
    styles: {normal: "768x1024#", admin: "30x30#", preview: '100x100#'},
    default_url: "/images/:style/missing.png",
    url: "/uploads/goods/:id/portrait/:style/:basename.:extension",
    path: ":rails_root/public/uploads/goods/:id/portrait/:style/:basename.:extension"    

  has_attached_file :landscape, 
    styles: {normal: "1024x768#", admin: "30x30#", preview: '100x100#'},
    default_url: "/images/:style/missing.png",
    url: "/uploads/goods/:id/landscape/:style/:basename.:extension",
    path: ":rails_root/public/uploads/goods/:id/landscape/:style/:basename.:extension"        

  has_attached_file :picture, 
    styles: {preview: "300x300#"},
    default_url: "/images/:style/missing.png",
    url: "/uploads/goods/:id/picture/:style/:basename.:extension",
    path: ":rails_root/public/uploads/goods/:id/picture/:style/:basename.:extension"

  has_attached_file :panorama, 
    styles: {preview: "300x300#"},
    default_url: "/images/:style/missing.png",
    url: "/uploads/goods/:id/panorama/:style/:basename.:extension",
    path: ":rails_root/public/uploads/goods/:id/panorama/:style/:basename.:extension"

  def categories
    good_category
  end

  def size
    size = []

    size << width if width
    size << height if height
    size << depth if depth

    (size.join "&times;").html_safe
  end

  def box_size
    size = []

    size << box_width if box_width
    size << box_height if box_height
    size << box_depth if box_depth

    (size.join "&times;").html_safe
  end

  def pictures 
    {
      desktop: picture,
      retina_portrait: portrait,
      retina_landscape: landscape,
      portrait: portrait.url(:normal),
      landscape: landscape.url(:normal)
    }
  end

end
