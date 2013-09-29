module AccessHelper
  def is_granted(role)
    if session[:role]
      session[:role].has_role role
    else
      false
    end
  end
end
