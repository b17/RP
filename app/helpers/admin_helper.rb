module AdminHelper
  require 'carrierwave'

  def save_image(file, id)
    unless file.nil?
      image_uploader = ImageUploader.new
      image_uploader.user_id = id
      unless Dir.exist? image_uploader.store_dir
        FileUtils.mkdir_p image_uploader.store_dir

      end
      image_uploader.store! file
      File.join(image_uploader.store_dir, file.original_filename)
    end
  end


end
