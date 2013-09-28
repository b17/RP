module AccessHelper
  def is_granted(role, &block)
    if session[:role]
      access_granted = session[:role].has_role role
    else
      access_granted = false
    end
    if block
      if access_granted
        block.call.html_safe
      else
        nil
      end
    else
      access_granted
    end
  end
end
