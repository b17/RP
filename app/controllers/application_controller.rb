class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :is_publisher
  before_filter :is_administrator

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

end
