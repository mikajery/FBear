require 'rubygems'
require 'zip'

class Three60 < MediaFile
  attr_accessor :src

  # validates :src, :attachment_presence => true
  # validates_attachment_content_type :src, :content_type => ['image/jpeg', 'image/png','image/gif']

  has_attached_file :src, 
    styles: {preview: "300x300#", admin: "30x30#"},
    default_url: "/images/:style/missing.png",
    url: "/uploads/good/:id/three60/:style/:basename.:extension",
    path: ":rails_root/public/uploads/good/:id/three60/:style/:basename.:extension"

  def unpack zip
    unless zip.nil?
      Zip::File::open(zip.path) do |archive|
        archive.each_with_index do |entry, index|
          
          if entry.file?
            path = File.join('tmp/zip', entry.name)

            FileUtils.mkdir_p File.dirname(path)
            archive.extract entry, path unless File.exist?(path)

            if index == 0
              Three60.preview self, path
            else
              Three60.item self, path
            end

            File.delete path if File.exist?(path)
          end
        end
      end
    end
  end

  def self.preview model, file
    file = File.open file
    model.src = file
    file.close
  end

  def self.item parent, file
    file = File.open file

    item = Three60.new(
      good: parent.good,
      src: file
    )

    item.media_file = parent
    item.save

    file.close
  end
end