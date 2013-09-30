class Pdf < ActiveRecord::Base  
  include MultilingualModel

  translates :name

  before_save :set_size

  belongs_to :good
  mount_uploader :src, PdfUploader

  validates_presence_of :src
  validates_presence_of :name

  def set_size
    self.size = src.file.size.to_s unless src.file.nil?
  end

  def filename
    File.basename(src.path) unless src and src.path.nil?
  end
end
