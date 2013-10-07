require 'rubygems'
require 'zip'

class Three60 < MediaFile
  attr_accessor :src

  default_scope { order('src_file_name ASC') }
  default_scope { where('is_uploaded is not null') }


  def items
    media_files.order('src_file_name ASC')
  end


  # validates :src, :attachment_presence => true
  # validates_attachment_content_type :src, :content_type => ['image/jpeg', 'image/png','image/gif']

  has_attached_file :src, 
    styles: {preview: "600x400#", thumb: "120x120#"},
    default_url: "/images/:style/missing.png",
    url: "/uploads/three60/:id/:style/:basename.:extension",
    path: ":rails_root/public/uploads/three60/:id/:style/:basename.:extension"

  def unpack path
    unless path.empty?
      Zip::File::open(path) do |archive|
        archive.each_with_index do |entry, index|
          
          if entry.file?
            image = File.join('tmp/zip/goods/', good.id.to_s, entry.name)

            FileUtils.mkdir_p File.dirname(image)
            archive.extract entry, image unless File.exist?(image)

            file = File.open image

            if index == 0
              Three60.preview self, file
            end

            Three60.item self, file
            file.close

            File.delete image if File.exist?(image)
          end
        end
      end

      File.delete path if File.exist?(path)
    end

    update({
      is_uploaded: true
    })
  end

  def self.preview model, file
    model.src = file
  end

  def self.item parent, file
    item = Three60.new(
      good: parent.good,
      src: file,
      is_uploaded: true
    )

    item.media_file = parent
    item.save
  end
end