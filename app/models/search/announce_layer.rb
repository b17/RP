class Search::AnnounceLayer < Search::Layer
  def initialize
    super
    add_provider Search::Common::GeoDistanceProvider.new
    add_provider Search::Announce::CategoryProvider.new
    add_provider Search::Announce::TagProvider.new
    add_provider Search::Announce::RepeatableProvider.new
    add_provider Search::Announce::DateProvider.new
  end

  def query(where)
    ::Announce.search '', where
  end

  def query_raw(where)
    ::Announce.search_for_ids('', where).raw
  end

  def url(params)
    Rails.application.routes.url_helpers.announce_search_path params
  end
end
