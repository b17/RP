class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init
  before_filter :is_publisher, :except => [:feed, :rand, :all_tags, :search, :fail ,:login , :logout,:debug_session ,:article]

  #roles
  #guest,admin, core_admin
  def is_administrator
    unless session[:role].to_i>1
      print session[:role]
      redirect_to fail_path
    end
  end

  def is_publisher
    unless session[:role].to_i>0
      print session[:role]
      redirect_to fail_path
    end

  end

  def user_id
    session[:id]
  end

  def init
    unless session[:init]
      location=Geocoder.search(request.ip)
      session[:ip]=request.ip
      session[:country]=location[0].data['country_name']
      session[:city]=location[0].data['city']
      session[:longitude]=location[0].data['longitude']
      session[:latitude]=location[0].data['latitude']
      session[:geo_distance]= 1 #km
      if location[0].data[:country_code]!='RD'
        session[:init]=true
      end
    end
  end

  def same_ip ip
    ip==session[:ip]
  end

  def layer_news
    @layer_news ||= Search::NewsLayer.new
  end

  def layer_announce
    @layer_announce ||= Search::AnnounceLayer.new
  end

end
