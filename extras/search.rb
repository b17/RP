module Search

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
  end

  class Provider
    def bind(params, search_criteria)
    end

    def apply(query, search_criteria)

    end

    def filters(where, search_criteria, filters_collection)

    end

    def unbind(params, search_criteria)
      if params.key? :distance
        search_criteria.delete(:geo)
      end
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

    def apply(query, search_criteria)
      if search_criteria.key? :geo
        geo = search_criteria[:geo]
        query[:geo] = [geo[:latitude], geo[:longitude]]
        query[:with] ||= {}
        query[:with][:geodist] = 0.0..geo[:distance]
      end
    end
  end

end