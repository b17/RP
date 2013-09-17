class RootController < ApplicationController
  layout 'guest'
  require 'geocoder'

  def feed
    init
    session[:geo_distance]=1 #kms


    # Important warning!
    # Sphinx uses strict types of filters.
    # For example, if field `latitude` is declared as float
    # you have to pass a float value not an integer!
    @items = Announce.nearest_search session[:longitude],session[:latitude],session[:geo_distance],12
    @news = News.nearest_search session[:longitude],session[:latitude],session[:geo_distance],3

    # Sphinx random order is much efficient then mysql, pg or sqlite.
    @random = Announce.search '', :order => 'created_at DESC' ,:per_page => 6
  end

  def article
    @article = News.where(:id => params[:id]).first
  end

  def tag
    init
    tag = request.params[:rewrite]
    @tag_name = t(tag)
    #Omg, it looks like bad shit
    tag_id = (Tag.find_by_rewrite tag).id
    announces = AnnounceTagger.find_all_by_tag_id tag_id
    @items_with_tag=Array.new
    announces.each do |a|
      @items_with_tag.append a.announce
    end
    @news = News.nearest_search session[:longitude],session[:latitude],session[:geo_distance],3
  end

  def all_tags
    init
    @tags=Tag.active
    @news=News.nearest_search session[:longitude],session[:latitude],session[:geo_distance],3
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

