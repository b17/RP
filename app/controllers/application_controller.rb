class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init
  before_filter :is_publisher, :except => [:feed, :rand]
  before_filter :is_administrator, :except => [:feed, :rand]

  #roles
  #guest,admin, core_admin
  def is_administrator
    session[:role]=='core_admin'
  end

  def is_publisher
    session[:role]==:admin
  end

  def user_id
    session[:id]
  end

  def init
    location=Geocoder.search(request.ip)
    unless session[:init] or same_ip(request.ip)
      session[:ip]=request.ip
      session[:country]=location[0].data[:country_name]
      session[:city]=location[0].data[:city]
      session[:longitude]=location[0].data[:longitude]
      session[:latitude]=location[0].data[:latitude]
      if location[0].data[:country_code]!='RD'
        session[:init]=true
      end
    end
  end

  def same_ip ip
    ip==session[:ip]
  end

end
