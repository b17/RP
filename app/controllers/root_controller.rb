class RootController < ApplicationController
  require 'geocoder'

  def feed
    init

  end

  def tag
    init
    @tag_name= get_tag_name request.params[:id]
  end

  def all_tags
    init
    #@tags=nil
  end

  def rand
    @random_list=Announce.where(:disabled => false)
  end

  def get_tag_name id
    #feetch from the base
    'fruits'
  end

  def announce
    id= params[:id]
    @announce= Announce.find id
  end

  def init
    unless session[:init]
      #location=Geocoder.search(request.ip)
      location=Geocoder.search("194.28.172.27") #For work
      session[:country]=location[0].data['country_name']
      session[:city]=location[0].data['city']
      session[:init]=true
    end
  end
end

