class SecureController < ApplicationController
  def login
    @login= request.params[:login]
    @password= request.params[:password]

    session[:id]=2
    session[:role]=:core_admin
    redirect_to :back
  end


  def logout
    session[:role]='guest'
    session[:id]=nil
    redirect_to :home
    session[:init]=false
  end

  def fail

  end
end
