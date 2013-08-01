class SuperuserController < ApplicationController
  layout 'superuser'
  #
  #post 'manage/add' => :c_add_tag
  #post 'manage/tag/update' => :c_update_tag
  #
  #get 'manage/tags/' => :p_view_tags
  #get 'manage/tags/:id/edit' => :p_edit_tag
  #
  #get 'manage/news/new'
  #get 'manage/news/all'
  #get 'manage/news/:id/edit/'
  #
  #post 'manage/news/create'
  #post 'manage/news/:id/update'
  #

  def view

  end


  def p_news_create

  end


  def c_news_add

  end

  def p_news_edit

  end

  def c_news_update
    id = params[:id]

  end

  def p_news_view
    News.where()
  end

  def p_view_tags
    @all_tags= Tag.all
  end

  def p_add_tag

  end

  def c_add_tag

  end

  def p_edit_tag

  end

  def c_update_tag

  end


end
