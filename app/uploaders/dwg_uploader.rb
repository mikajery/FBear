# todo краткое описание класса
class DwgUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/good/#{model.good.id}/dwg/#{model.id}"
  end

  def extension_white_list
    %w(dwg)
  end
end
