class RootController < ApplicationController
  layout 'guest'
  require 'geocoder'

  def feed
    init

    #@items=Announce.where(:disabled => false).limit(10)
    @items=Announce.locale session[:longitude], session[:latitude], 10
    @news=News.locale session[:longitude], session[:latitude], 3
    @random = Announce.where(:disabled => false).order("RANDOM()").limit(6)
  end


  def tag
    init
    tag = request.params[:id]
    @tag_name=tag
    announce = Announce.arel_table
    @items_with_tag = Announce.where(announce[:tag_1].eq(tag).or(announce[:tag_2].eq(tag).or(announce[:tag_3].eq(tag))))
    @news = News.active
  end

  def all_tags
    init
    @tags=Tag.active
    @news=News.active
  end

  def rand
    @news=News.where(disabled: false).order('created_at DESC').limit(3)
    @random_list=Announce.where(:disabled => false).limit(20)
  end

  def get_tag_name id
    #feetch from the base
    'fruits'
  end

  def announce
    id= params[:id]
    @announce= Announce.find id
  end


end

