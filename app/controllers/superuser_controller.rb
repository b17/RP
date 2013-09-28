class SuperuserController < ApplicationController
  layout 'superuser'

  before_filter do
    user_has_role :core_admin
  end

  def view

  end

end
