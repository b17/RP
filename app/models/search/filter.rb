class Search::Filter
  attr_reader :options, :collection, :label, :request_param_name

  def initialize(label, request_param_name, opts = {})
    @label = label
    @options = []
    @request_param_name = request_param_name
    @opts = opts
  end

  def collection=(collection)
    @collection = collection
  end

  def add(option)
    option.filter = self
    @options.push(option)
  end

  def prepare_params
    # hack
    # is an equivalent to deep_copy
    query_params = Marshal.load(Marshal.dump(@collection.params))

    query_params.delete :controller
    query_params.delete :action
    query_params.delete :format

    query_params
  end

  def apply_url(value)
    params = prepare_params
    if @opts[:multi]
      params[@request_param_name] ||= []
      params[@request_param_name] << value
    else
      params[@request_param_name] = value
    end
    @collection.layer.url params
  end


  def cancel_url(value)
    params = prepare_params
    if @opts[:multi] and params[@request_param_name].kind_of? Array
      params[@request_param_name].delete value.to_s
      params.delete @request_param_name if params[@request_param_name].length == 0
    else
      params.delete(@request_param_name)
    end
    @collection.layer.url params
  end

  def template
    raise NotImplementedError
  end
end