class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init
  after_filter :shutdown_access
  #before_filter :is_publisher, :except => [:feed, :rand, :all_tags, :search, :fail ,:login , :logout,:debug_session ,:article]

  #roles
  #guest,admin, core_admin
  def is_administrator
    unless session[:role].to_i>1
      print session[:role]
      redirect_to fail_path
    end
  end

  def user_has_role(role)
    if session[:role].name == :guest
      flash[:error] = t 'error.access.login'
      redirect_to login_path :next => request.url
    else
      unless session[:role].has_role role
        redirect_to error_access_path
      end
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

    session[:role] = access_provider.get (session[:role] || :guest).to_sym unless session[:role].kind_of? Access::Role
  end

  def shutdown_access
    # store just role code, do not serialize all object.
    session[:role] = session[:role].name
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

  def access_provider
    unless @access_provider
      @access_provider = Access::Provider.new

      # guest user
      role_guest = Access::Role.new :guest
      @access_provider << role_guest

      # visitor
      role_user = Access::Role.new :user
      @access_provider << role_user

      # can publish announces
      role_admin = Access::Role.new :admin
      role_admin.extends role_user
      @access_provider << role_admin

      # can do everything
      role_core_admin = Access::Role.new :core_admin
      role_core_admin.extends role_admin
      @access_provider << role_core_admin
    end
    @access_provider
  end

end
