class MediaFile < ActiveRecord::Base
  belongs_to :media_file
  belongs_to :good

  has_many :media_files, dependent: :destroy

  def items
    media_files
  end
end
