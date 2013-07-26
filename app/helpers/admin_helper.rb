module AdminHelper

  #Hand made storage
  #def save_image(image)
  #  session[:id].nil? do
  #    return -1
  #  end
  #
  #  path=Rails.root.join('app', 'files', 'img', 'announces', session[:id].to_s)
  #  unless Dir.exist? path
  #    FileUtils.mkdir_p path
  #  end
  #  rel_utl = File.join('files', 'img', 'announces', session[:id].to_s, image.original_filename)
  #  file_path= Rails.root.join('app', rel_utl)
  #  File.open(file_path, "wb") { |f| f.write(image.tempfile.read) }
  #  rel_utl
  #end

  def save_image file
    unless file.nil?
      image_uploader = ImageUploader.new
      image_uploader.store! file
      file.filename
    end
  end


end
