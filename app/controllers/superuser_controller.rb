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

  def p_create_tag

  end

  def c_tag_add
    name = params[:name]
    image = params[:image]

    if name.nil?&&image.nil?

    else
      tag_uploader = TagUploader.new
      tag = Tag.new
      tag.name=name
      filename = tag_uploader.store! image
      tag.img_url= filename
      tag.save
    end


  end

  def p_edit_tag

  end

  def c_update_tag

  end


end
