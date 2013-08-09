class NewsController < ApplicationController
  layout 'superuser'

  def p_all
    @active_news = News.where(:disabled => false)
    @disabled_news =News.where(:disabled => true)
  end

  def p_add
  end

  def c_save
    news = params[:news]
    item = News.new

    item.title=news[:title]
    item.short_info=news['short_description']
    item.content=news['full_description']
    item.image=news[:image]
    item.user_id=session[:id]

    item.save

  end

  def c_disable
    if is_core_admin
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
    if is_core_admin
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
  end

  def c_update

  end

  def c_activate
    if is_core_admin
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
end
