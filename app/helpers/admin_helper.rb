module AdminHelper
  require 'carrierwave'

  def save_image file
    unless file.nil?
      image_uploader = ImageUploader.new
      image_uploader.store! file
      File.join(image_uploader.store_dir, file.original_filename)
    end
  end


end
