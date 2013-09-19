class RootController < ApplicationController
  layout 'guest'
  require 'geocoder'

  def feed
    init

    params[:distance] ||= 1000 # distance in meters (THIS IS AN EXAMPLE)
    params[:latitude] = session[:latitude] # current coords for GeoDistanceProvider
    params[:longitude] = session[:longitude] # current coords for GeoDistanceProvider

    search_criteria = layer_news.bind params
    sphinx_criteria = layer_news.apply search_criteria
    p sphinx_criteria
    sphinx_criteria[:order] = 'geodist ASC'

    @items = layer_announce.query sphinx_criteria

    @news = layer_news.query sphinx_criteria

    @random = layer_announce.query :order => 'created_at DESC'
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

