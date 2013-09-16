class UserServiceController < ApplicationController
  layout 'guest'

  def p_register

  end

  def p_reset
  end

  def p_login
  end

  def c_reset
  end

  # Validates registration form login field for uniqueness
  def validate
    user = User.new(:login => params[:login].strip)
    user.valid?
    render json: !user.errors[:login].any?
  end


  def login
    login= request.params[:login]
    password= Digest::MD5.hexdigest request.params[:password]


    usr = User.where(:login => login, :password => password).limit 1
    if usr[0].nil?
      redirect_to :fail_login
    else
      session[:id]=usr[0].id.to_i
      session[:role]=usr[0].role.to_s
      redirect_to admin_path
    end
  end


  def debug_session
    if is_administrator
      @param=session
    else
      redirect_to :fail_permissions
    end
  end


  def logout
    session[:role]='guest'
    session[:id]=nil
    session[:init]=false
    redirect_to :home
  end

  def fail

  end

  def c_register

    user_find_by_login = User.find_by_login params[:register][:login]

    if user_find_by_login.nil?
      new_user=User.new(params[:register])
      new_user.password= Digest::MD5.hexdigest params[:register][:password]
      new_user.save
      @users=User.all
    else
      redirect_to :user_exist
    end
  end
end
