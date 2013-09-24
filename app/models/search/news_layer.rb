class Search::NewsLayer < Search::Layer
  def initialize
    super
    add_provider Search::Common::GeoDistanceProvider.new
  end

  def query(where)
    News.search '', where
  end
end