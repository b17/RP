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

    tags = [news[:tag_1], news[:tag_2], news[:tag_3]]

    item.tags.clear
    tags.each do |tag|
      unless tag.nil?

        the_tag = Tag.find(tag).first
        unless the_tag.nil?
          item.tags<<(the_tag)
        end
      end
    end


    item.lg= news[:longitude].to_f
    item.lt= news[:latitude].to_f

    item.save
    redirect_to :manage_news

  end

  def c_disable
    id=params[:id]
    news = News.find id
    unless news.nil?
      news.disabled=true
      news.save
    end
    redirect_to :back
  end

  def c_delete
    id=params[:id]
    news = News.find id
    unless news.nil?
      news.delete
    end
    redirect_to :back
  end

  def p_edit
    id=params[:id]
    @edit_item = News.find id
    @tags = Tag.active
    @categories=Category.active

    @e_longitude=session[:longitude]
    @e_latitude=session[:latitude]
  end

  def c_news_update
    id = params[:id]
    item = News.find id

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
    tags = params[:tags]

    item.tags.clear
    tags.each do |tag|
      the_tag = Tag.where(id: tag[1]).first
      unless the_tag.nil?
        item.tags<<(the_tag)
      end
    end
    #----------------------
    #Tags updated

    #Location update
    item.lg= news[:longitude].to_f
    item.lt= news[:latitude].to_f

    item.save
    redirect_to :manage_news

  end

  def c_activate
    id=params[:id]
    news = News.find id
    unless news.nil?
      news.disabled=false
      news.save
    end
    redirect_to :back
  end

  def p_info
    id=params[:id]
    @item=News.find id

  end
end
