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

  def total
    @matched_count
  end

  def apply_url
    @filter.apply_url @value
  end

  def cancel_url
    @filter.cancel_url @value
  end
end