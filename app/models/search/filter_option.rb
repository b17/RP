class Search::FilterOption
  attr_reader :label, :active

  def initialize(label, value, active = false, matched_count = 0)
    @label = label
    @value = value
    @active = active
    @matched_count = matched_count
  end

  def filter=(filter)
    @filter = filter
  end

  def prepare_query_hash
    query_params = @filter.collection.request.parameters.clone
    query_params.delete(:controller)
    query_params.delete(:action)
    query_params.delete(:format)

    query_params
  end

  def apply_url
    '?' + prepare_query_hash().merge({:category => [@value]}).to_query
  end

  def cancel_url
    query_hash = prepare_query_hash
    query_hash.delete :category if query_hash.key? :category
    '?' + query_hash.to_query
  end
end