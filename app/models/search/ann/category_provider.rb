class Search::Ann::CategoryProvider < Search::Provider
  def bind(params, search_criteria)
    if params.key? :category
      search_criteria[:category] = params[:category].to_i
    end
  end

  def apply(query, search_criteria)
    if search_criteria.key? :category
      query[:categories] = search_criteria[:category]
    end
  end

  def filters(where, search_criteria, filters_collection)
    filter = Search::Filter.new(I18n::t(:filter_category))
    where[:group_by] = 'categories'
    where[:order_by] = '@count DESC'
    where[:sql] = {:include => 'categories'}
    @layer.query(where).each do |row|
      option = Search::FilterOption.new('test', 2)
      filter.add option
    end
    filters_collection.add filter
  end

  def unbind(params, search_criteria)
  end
end