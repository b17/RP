class Announce::DefaultController < ApplicationController

  layout 'guest'

  def search
    where = layer_announce.bind_and_apply params
    @announces = layer_announce.query where
    @filters = layer_announce.filters params, request
  end

  def view
    @announce = Announce.find params[:id]
  end
end
