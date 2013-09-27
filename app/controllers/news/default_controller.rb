class News::DefaultController < ApplicationController
  layout 'guest'

  def search
    where = layer_news.bind_and_apply params
    @news = layer_news.query where
  end
end
