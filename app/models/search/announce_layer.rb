class Search::AnnounceLayer < Search::Layer
  def initialize
    super
    add_provider Search::Common::GeoDistanceProvider.new
    add_provider Search::Announce::CategoryProvider.new
    add_provider Search::Announce::TagProvider.new
  end

  def query(where)
    ::Announce.search '', where
  end
end
