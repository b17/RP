class ImageController < ApplicationController
  def announce_images
    item_id = params[:id]
    item = Announce.find item_id
    logger.print item
    send_file item.image
  end


  #Default show Image method streams the file contents.
  #File doesn't have to be in public/ dir
  def show
    item_id = params[:id]
    item = Announce.find item_id
    send_file item.image, :type => 'image/*',
              :disposition => 'inline'
  end

  # Use your favorite authorization system to restrict access
  filter_access_to :show, :require => :view, :attribute_check => :true

end
