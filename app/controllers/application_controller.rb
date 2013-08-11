class ApplicationController < ActionController::Base
  protect_from_forgery
  #roles
  #guest,admin, core_admin
  def is_core_admin
    session[:role]=='core_admin'
  end

  def is_admin
    session[:role]==:admin
  end

  def user_id
    session[:id]
  end
end
