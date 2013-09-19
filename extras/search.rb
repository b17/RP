module Search

  class Filter
    def initialize(label)
      @label = label
    end

    def add(option)
      option.filter = self
    end
  end

  class FiltersCollection
    def initialize(request)
      @filters = []
      @request = request #for url building
    end
    def add(filter)
      filter.collection = filter
      @filters.push(filter)
    end
  end

  class FilterOption
    def initialize(label, value, active = false, matched_count = 0)
      @label = label
      @value = value
      @active = active
      @matched_count = matched_count
    end
  end

  class Layer
    def initialize
      @providers = []
    end

    def add_provider(provider)
      unless provider.kind_of? Search::Provider
        throw ArgumentError.new "Provider shout be an instance of SearchLayerProvider class, but #{provider.class} got."
      end
      @providers.push(provider)
    end

    def bind(params, search_criteria = {})
      @providers.each do |provider|
        provider.bind(params, search_criteria)
      end
      search_criteria
    end

    def apply(search_criteria)
      where = {}
      @providers.each do |provider|
        provider.apply(where, search_criteria)
      end
      where
    end

    def filters(params, request)
      filters = Search::FiltersCollection.new request
      search_criteria = bind params
      where = apply search_criteria
      @providers.each do |provider|
        provider.filters where, search_criteria, filters
      end
      filters
    end

    def query(where)
      raise NotImplementedError
    end
  end

  class Provider
    def bind(params, search_criteria)
    end

    def apply(query, search_criteria)

    end

    def filters(where, search_criteria, filters_collection)

    end

    def unbind(params, search_criteria)
    end
  end

  class GeoDistanceProvider < Search::Provider

    def bind(params, search_criteria)
      if params.key? :distance
        search_criteria[:geo] = {
            :distance => params[:distance].to_f,
            :latitude => (params[:latitude] || 0).to_f,
            :longitude => (params[:longitude] || 0).to_f
        }
      end
    end

    def filters(where, search_criteria, filters_collection)
    end

    def apply(query, search_criteria)
      if search_criteria.key? :geo
        geo = search_criteria[:geo]
        query[:geo] = [geo[:latitude], geo[:longitude]]
        query[:with] ||= {}
        query[:with][:geodist] = 0.0..geo[:distance]
      end
    end
  end


  class NewsLayer < Search::Layer
    def initialize
      super
      add_provider Search::GeoDistanceProvider.new
    end

    def query(where)
      News.search '', where
    end
  end

  class AnnounceLayer < Search::Layer
    def initialize
      super
      add_provider Search::GeoDistanceProvider.new
    end

    def query(where)
      Announce.search '', where
    end
  end

end