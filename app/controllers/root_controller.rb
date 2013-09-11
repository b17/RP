class RootController < ApplicationController
  layout 'guest'
  require 'geocoder'

  def feed
    init

    geo_distance = 1 # kms

    # Important warning!
    # Sphinx uses strict types of filters.
    # For example, if field `latitude` is declared as float
    # you have to pass a float value not an integer!
    @items = Announce.search '',
                           :geo => [GeoHelper.to_rads(session[:latitude]), GeoHelper.to_rads(session[:longitude])],
                           :order => 'geodist ASC',
                           :with => {:geodist => 0.0..GeoHelper.to_meters(geo_distance).to_f},
                           :per_page => 10

    @news = News.search '',
                       :geo => [GeoHelper.to_rads(session[:latitude]), GeoHelper.to_rads(session[:longitude])],
                       :order => 'geodist ASC',
                       :with => {:geodist => 0.0..GeoHelper.to_meters(geo_distance).to_f},
                       :per_page => 10

    # Sphinx random order is much efficient then mysql, pg or sqlite.
    @random = Announce.search '', :order => 'created_at DESC'
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

