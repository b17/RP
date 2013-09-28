class ErrorController < ApplicationController
  def access
    response.status = 403
  end
end
