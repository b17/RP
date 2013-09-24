class Search::AnnounceLayer < Search::Layer
  def initialize
    super
    add_provider Search::Common::GeoDistanceProvider.new
    add_provider Search::Ann::CategoryProvider.new
  end

  def query(where)
    Announce.search '', where
  end
end
