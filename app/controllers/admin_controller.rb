class AdminController < ApplicationController
  include AdminHelper
  include SecureHelper

  layout 'admin'

  before_filter do
    user_has_role :admin
  end


  def welcome

  end

  def info
    @item= Announce.find(params[:id])
    if @item.nil?
      redirect_to :not_found
    end
    @path=Rails.root
    @image_name=@item.image
    #@back=request.
  end


  def p_my_announces
    @active = Announce.where(:user_id => session[:id], :disabled => false)
    @disabled = Announce.where(:user_id => session[:id], :disabled => true)
  end

  def p_text_stats
    @items=Announce.active_by_id session[:id]
  end

  def p_map_stats
  end

  def p_calendar
  end

  def p_add
    @longitude=session[:longitude]
    @latitude=session[:latitude]
    @tags=Tag.active
    @categories=Category.active
  end

  def c_add
    params=request.params
    image = params[:announce][:image]
    logger.print image
    item = Announce.new

    unless image.nil?
      item.image = image
    end
    #parse date
    date = params[:announce][:date]
    date_parse = DateTime.strptime(date, "%d/%m/%Y %H:%M")
    unless date_parse.nil?
      item.action_date=date_parse
    end

    item.title=params[:announce][:title]

    item.lt=params[:announce][:latitude].to_f
    item.lg=params[:announce][:longitude].to_f

    ####################################
    #               Tags               #
    #       support only three tags    #
    ####################################


    tags = [params[:announce][:tag_1], params[:announce][:tag_2], params[:announce][:tag_3]]

    item.tags.clear
    tags.each do |tag|

      the_tag = Tag.where(:id=>tag).first
      unless the_tag.nil?
        item.tags<<(the_tag)
      end
    end
    ####################################
    #            Categories            #
    ####################################
    categories=params[:category]
    item.category.clear
    categories.each do  |cat|
      category=Category.where(:id=>cat).first
      unless category.nil?
        item.category<< category
      end
    end



    #####################################

    item.desc=params[:announce][:desc]
    item.user_id=session[:id]
    item.save


    redirect_to :announce

  end

  def c_delete
    id=params[:id]
    item= Announce.find id

    if  item.user_id==session[:id]
      Announce.delete(item)
      redirect_to :back
    else
      redirect_to :auth_fail
    end

  end

  def c_disable
    id= params[:id]
    item = Announce.find id
    unless item.nil?
      if session[:id]==item.user_id
        item.disabled=true
        item.save

        notify_tags item

        redirect_to :back
      else
        redirect_to :home
      end
    end
  end

  def p_edit
    id=params[:id]
    item = Announce.find id
    if item.user_id==session[:id].to_i
      @item=item
      @tags = Tag.active
    else
      redirect_to :home
    end

  end


  def c_update_announce
    @params=request.params
    item = Announce.find params[:announce][:id]
    if item.nil?
      redirect_to :to
    elsif session[:id]==item.user_id.to_i
      #check if new image available
      image = params[:announce][:image]
      unless image.nil?
        item.image = image
      end

      item.title=@params[:announce][:title]
      date = @params[:announce][:date]

      date_parse = Date.parse(date)
      unless date_parse.nil?
        item.action_date=date_parse
      end
      #end

      #Tags setting
      #support only three tags
      tag_1 = params[:announce][:tag_1]



      item.desc=@params[:announce][:desc]
      item.user_id=session[:id]
      item.save
      redirect_to :announce
    else
      redirect_to :permission_not_allowed
    end


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

  def notify_tags(item)


  end

end
