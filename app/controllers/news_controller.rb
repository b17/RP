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
  end

  def c_delete
  end

  def p_edit
  end

  def c_update

  end

  def c_activate

  end
end
