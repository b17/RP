class Search::Announce::RepeatableProvider < Search::Provider

  def request_param_name
    @request_param_name ||= :repeatable
  end

  def bind(params, search_criteria)
    if params[request_param_name]
      search_criteria[:repeatable] = params[request_param_name].to_i
    end
  end

  def apply(query, search_criteria)
    if search_criteria[:repeatable]
      query[:with][:is_repeated] = search_criteria[:repeatable]
    end
  end

  def filters(where, search_criteria, filters_collection)
    where[:group_by] = 'is_repeated'
    where[:order_by] = '@count DESC'

    filter = Search::ListFilter.new(I18n::t(:filter_repeatable), request_param_name)
    @layer.query_raw(where).each do |row|
      option_label = row['@groupby'] == 1 ? I18n::t(:filter_repeatable_multi) : I18n::t(:filter_repeatable_once)
      option = Search::Announce::FilterOption.new option_label, row['@groupby'], search_criteria[:repeatable] == row['@groupby'], row['@count']
      filter.add option
    end
    filters_collection.add :repeatable, filter if filter.options.length > 0
  end

end