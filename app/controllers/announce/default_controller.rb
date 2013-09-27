class Announce::DefaultController < ApplicationController

  layout 'search' #same like guest , but with search.css

  def search
    where = layer_announce.bind_and_apply params
    news_where = layer_news.bind_and_apply params
    @announces = layer_announce.query where
    @filters = layer_announce.filters params
    @news =layer_news.query news_where
  end

  def view
    @announce = Announce.find params[:id]
  end
end
