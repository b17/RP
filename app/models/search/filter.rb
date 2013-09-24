class Search::Filter
  attr_reader :options, :collection, :label

  def initialize(label)
    @label = label
    @options = []
  end

  def collection=(collection)
    @collection = collection
  end

  def add(option)
    option.filter = self
    @options.push(option)
  end
end