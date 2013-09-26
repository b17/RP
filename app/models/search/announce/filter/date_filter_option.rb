class Search::Announce::Filter::DateFilterOption < Search::Announce::FilterOption
  def start_time
    @label
  end
end