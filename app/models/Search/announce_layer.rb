module Search
  class AnnounceLayer
    def initialize
      super
      #add_provider Search::GeoDistanceProvider.new
      add_provider Search::Announce::CategoryProvider.new
    end

    def query(where)
      Announce.search '', where
    end
  end
end