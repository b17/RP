class Search::Announce::DateProvider < Search::Provider

  def request_param_name
    @request_param_name = 'date'
  end

  def bind(params, search_criteria)
    if params[request_param_name]
      search_criteria[:date] = params[request_param_name].to_i
    end
  end

  def apply(query, search_criteria)
    if search_criteria[:date]
      query[:with][:action_date] = search_criteria[:date]
    end
  end

  def filters(where, search_criteria, filters_collection)
    where[:group_by] = 'action_date'
    where[:order_by] = 'action_date'

    filter = Search::Announce::Filter::DateFilter.new(I18n::t('filter.announce.date'), request_param_name)
    @layer.query(where).raw.each do |row|
      d = Time.at(row['@groupby']).to_date
      option = Search::Announce::Filter::DateFilterOption.new d, row['action_date'], search_criteria[:date] == row['@groupby'], row['@count']
      filter.add option
    end

    filters_collection.add :dates, filter if filter.options.length > 0
  end

  def unbind(params, search_criteria)
  end
end