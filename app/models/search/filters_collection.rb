class Search::FiltersCollection
  attr_reader :request

  def initialize(request)
    @filters = []
    @request = request #for url building
  end

  def each
    @filters.each do |filter|
      yield filter
    end
  end

  def add(filter)
    filter.collection = self
    @filters.push(filter)
  end
end