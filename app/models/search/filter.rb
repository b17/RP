class Search::Filter
  attr_reader :options, :collection, :label, :request_param_name

  def initialize(label, request_param_name)
    @label = label
    @options = []
    @request_param_name = request_param_name
  end

  def collection=(collection)
    @collection = collection
  end

  def add(option)
    option.filter = self
    @options.push(option)
  end
end