class Search::NewsLayer < Search::Layer
  def initialize
    super
    add_provider Search::Common::GeoDistanceProvider.new
  end

  def query(where)
    News.search '', where
  end

  def url(params)
    Rails.application.routes.url_helpers.news_search_path params
  end
end