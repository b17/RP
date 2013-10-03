class Announce::DefaultController < ApplicationController

  layout 'guest'

  def search
    where = layer_announce.bind_and_apply params
    where[:page] = params[:page]
    where[:per_page] = 15
    @announces = layer_announce.query where
    @filters = layer_announce.filters params

    news_where = layer_news.bind_and_apply params
    @news =layer_news.query news_where
  end

  def view
    @announce = Announce.find params[:id]
  end
end
