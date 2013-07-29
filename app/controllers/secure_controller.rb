class SecureController < ApplicationController
  def login
    @login= request.params[:login]
    @password= request.params[:password]
    #redirect_to :failed_login
    #@meta=request
    #session[:user_role]='core-admin'
    session[:id]=2
    session[:role]='admin'
    redirect_to :back
  end


  def logout
    session[:role]='guest'
    session[:id]=nil
    redirect_to :home
  end

  def fail

  end
end
