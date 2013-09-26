class Search::Layer
  def initialize
    @providers = []
  end

  def add_provider(provider)
    unless provider.kind_of? Search::Provider
      throw ArgumentError.new "Provider shout be an instance of Search::Provider class, but #{provider.class} got."
    end
    provider.layer = self
    @providers.push(provider)
  end

  def bind(params, search_criteria = {})
    @providers.each do |provider|
      provider.bind(params, search_criteria)
    end
    search_criteria
  end

  def bind_and_apply(params)
    search_criteria = bind params
    apply search_criteria
  end

  def apply(search_criteria)
    where = {:with => {}}
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
      provider.filters where.clone, search_criteria, filters
    end
    filters
  end

  def query(where)
    raise NotImplementedError
  end
end