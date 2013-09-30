class Good < ActiveRecord::Base
  include SortedByName
  include MultilingualModel
  include SluggableModel
  include AutotitleableModel

  translates :price, :title, :heading, :keywords, :description, :announce, :content, :additional

  has_and_belongs_to_many :good_category
  has_and_belongs_to_many :designer
  has_and_belongs_to_many :material

  has_one :video
  has_one :panorama
  has_many :pdfs
  has_many :three60s, conditions: {media_file_id: nil}

  validates :name, presence: true
  validates :designer, presence: true

  attr_accessor :picture
  attr_accessor :logo

  validates :logo, :attachment_presence => true
  validates_attachment_content_type :logo, :content_type => ['image/jpeg', 'image/png','image/gif']

  validates :picture, :attachment_presence => true
  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png','image/gif']

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

  def update params
    if params[:panorama]
      panorama = Panorama.create({
        good: self,
        src: params[:panorama]
      })
    end
  end

end
