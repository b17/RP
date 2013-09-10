class NewsController < ApplicationController
  layout 'superuser'

  def p_all
    @active_news = News.active
    @disabled_news =News.disabled
  end

  def p_add
    @tags= Tag.active
    @longitude=session[:longitude]
    @latitude=session[:latitude]
  end

  def c_save
    news = params[:news]
    item = News.new

    item.title=news[:title]
    item.short_info=news['short_description']
    item.content=news['full_description']
    unless news[:image].nil?
      item.image=news[:image]
    end
    item.user_id=session[:id]

    unless news[:tag_1].nil?
      item.tag_1 =news[:tag_1]
    end
    unless news[:tag_2].nil?
      item.tag_2 =news[:tag_2]
    end
    unless news[:tag_3].nil?
      item.tag_3 =news[:tag_3]
    end

    item.lg= news[:longitude].to_f
    item.lt= news[:latitude].to_f

    item.save
    redirect_to :manage_news

  end

  def c_disable
    if is_administrator
      id=params[:id]
      news = News.find id
      unless news.nil?
        news.disabled=true
        news.save
      end
      redirect_to :back
    else
      redirect_to :fail_permissions
    end
  end

  def c_delete
    if is_administrator
      id=params[:id]
      news = News.find id
      unless news.nil?
        news.delete
      end
      redirect_to :back
    else
      redirect_to :fail_permissions
    end
  end

  def p_edit
    if is_administrator
      id=params[:id]
      @edit_item = News.find id
      @tags = Tag.active

      @e_longitude=session[:longitude]
      @e_latitude=session[:latitude]

    end

  end

  def c_news_update
    id = params[:id]
    item = News.find id
    if is_administrator and !item.nil?
      news = params[:news]
      item.title=news[:title]
      item.short_info=news['short_description']
      item.content=news['full_description']
      unless  news[:image].nil?
        item.image=news[:image]
      end

      unless news[:image].nil?
        item.image=news[:image]
      end

      #Update tags
      if news[:tag_1].nil?
        item.tag_1=nil
      else
        item.tag_1 =news[:tag_1]
      end
      #----------------------
      if news[:tag_2].nil?
        item.tag_1=nil
      else
        item.tag_2 =news[:tag_2]
      end
      #----------------------
      if news[:tag_3].nil?
        item.tag_1=nil
      else
        item.tag_3 =news[:tag_3]
      end
      #----------------------
      #Tags updated

      #Location update
      item.lg= news[:longitude].to_f
      item.lt= news[:latitude].to_f

      item.save
      redirect_to :manage_news
    end
  end

  def c_activate
    if is_administrator
      id=params[:id]
      news = News.find id
      unless news.nil?
        news.disabled=false
        news.save
      end
      redirect_to :back
    else
      redirect_to :fail_permissions
    end
  end

  def p_info
    if is_administrator
      id=params[:id]
      @item=News.find id
    end
  end
end
