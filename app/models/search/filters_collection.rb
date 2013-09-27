class Search::FiltersCollection
  attr_reader :params, :layer

  def initialize(params, layer)
    @filters = []
    @params = params #for url building
    @layer = layer
  end

  def each
    @filters.each do |filter|
      yield filter
    end
  end

  def add(filter_code, filter)
    filter.collection = self
    @filters.push(filter)
  end
end