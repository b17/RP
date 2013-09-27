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
    usr = User.authenticate params[:login], params[:password]
    if usr
      session[:id]=usr.id.to_i
      session[:role]=to_level usr.role.to_s
      redirect_to admin_path
    else
      redirect_to :fail_login
    end
  end


  def to_level level
    if level=='core_admin'
      return 2
    end
    if level=='admin'
      return 1
    end

    0
  end


  def debug_session
      @param=session
  end


  def logout
    session[:role]=0
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
