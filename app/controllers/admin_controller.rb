class AdminController < ApplicationController
  include AdminHelper
  include SecureHelper

  layout 'admin_layout'


  def welcome

  end

  def info
    selected_item = Announce.find(params[:id])
    if selected_item.nil?
      redirect_to :not_found
    end
    @path=Rails.root
    @item=selected_item
    image_uploader = ImageUploader.new
    @image=image_uploader.retrieve_from_store!(selected_item.main_img_url)
    @image_name=selected_item.main_img_url
  end

  def p_add

  end

  def p_my_announces
    @active = Announce.where(:user_id => session[:id], :disabled => false)
    @disabled = Announce.where(:user_id => session[:id], :disabled => true)
  end

  def p_text_stats
  end

  def p_map_stats
  end

  def p_calendar
  end

  def c_add
    @params=request.params
    image = params[:announce][:image]
    logger.print image
    item = Announce.new

    unless image.nil?
      item.main_img_url = save_image image
    end

    item.title=@params[:announce][:title]
    item.action_date=@params[:announce][:date]
    item.desc=@params[:announce][:desc]
    item.user_id=session[:id]
    item.save


    redirect_to :announce

  end

  def c_delete
    redirect_to :back
  end

  def c_disable
    id= params[:id]
    item = Announce.find id
    unless item.nil?
      if session[:id]==item.user_id
        item.disabled=true
        item.save
        redirect_to :back
      else
        redirect_to :home
      end
    end
  end

  def p_edit
  end

  def c_activate
    id=params[:id]
    item=Announce.find id
    if item.user_id==session[:id]
      item.disabled=false
      item.save
      redirect_to :back
    else
      redirect_to :home
    end

  end


end
