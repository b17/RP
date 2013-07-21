class SecureController < ApplicationController
  def login
    @login= request.params[:login]
    @password= request.params[:password]
    #redirect_to :failed_login
    #@meta=request
    #session[:user_role]='core-admin'
    session[:user_id]=1
    session[:user_role]='admin'
    redirect_to :back
  end


  def logout
    session[:user_role]='guest'
    redirect_to :back
  end

  def fail

  end
end
