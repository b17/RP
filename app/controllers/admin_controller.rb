class AdminController < ApplicationController
  include AdminHelper
  layout 'admin_layout'
  id = 1

  def welcome

  end

  def info
    selected_item = Announce.find(params[:id])
    if selected_item.nil?
      redirect_to :not_found
    end
    @path=Rails.root
    @item=selected_item


  end

  def p_add

  end

  def p_my_announces
    @all = Announce.all
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
    image_path =save_image image
    item = Announce.new
    item.title=@params[:announce][:title]
    item.action_date=@params[:announce][:date]
    item.desc=@params[:announce][:desc]
    item.main_img_url=image_path
    item.save

    redirect_to :announce
    #render 'util/show_param'

  end

  def c_delete
  end

  def c_disable
  end

  def p_edit
  end

end
