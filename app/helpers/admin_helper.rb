module AdminHelper

  def save_image(image)
    path=Rails.root.join('img', 'announces', '1')
    unless Dir.exist? path
      Dir.mkdir path
    end
    rel_utl = File.join('img', 'announces', '1', image.original_filename)
    file_path= Rails.root.join(rel_utl)
    File.open(file_path, "wb") { |f| f.write(image.tempfile.read) }
    rel_utl
  end
end
