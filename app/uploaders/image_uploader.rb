class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fit:  [310, 310]

  version :thumb do
    process resize_to_fit:  [50, 50]
  end
end
