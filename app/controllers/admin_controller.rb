class AdminController < ApplicationController
  include AdminHelper
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
  end

  def p_add

  end

  def p_my_announces
    @all = Announce.find_all_by_user_id session[:id]
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
      save_image image
      item.main_img_url
    end

    item.title=@params[:announce][:title]
    item.action_date=@params[:announce][:date]
    item.desc=@params[:announce][:desc]
    item.user_id=session[:id]
    item.save


    redirect_to :announce
    #render 'util/show_param'

  end

  def c_delete
  end

  def c_disable
    id= params[:id]
    item = Announce.find id
    unless item.nil?
      #item.
    end
  end

  def p_edit
  end

end
