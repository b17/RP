class Search::Announce::CategoryProvider < Search::Provider

  def request_param_name
    @request_param_name ||= :category
  end

  def bind(params, search_criteria)
    if params.key? request_param_name
      search_criteria[request_param_name] = params[:category].to_i
    end
  end

  def apply(query, search_criteria)
    if search_criteria.key? :category
      query[:with][:category_id] = search_criteria[:category]
    end
  end

  def filters(where, search_criteria, filters_collection)
    where[:group_by] = 'category_id'
    where[:order_by] = '@count DESC'

    category_counts = {}

    # We can't get category id and name directly from sphinx response (Many-to-Many)
    # So we collect counts and category ids from sphinx
    # And then perform SQL query to the DB.
    sphinx_result = @layer.query(where).raw()
    sphinx_result.each do |row|
      category_counts[row['@groupby']] = row['@count']
    end

    if category_counts.length
      filter = Search::Filter.new(I18n::t(:filter_category), request_param_name)
      categories = Category.select('id, name').where({:id => category_counts.keys}).order('FIELD(id, %{ids})' % {:ids => category_counts.keys.join(',')})
      categories.each do |category|
        option = Sear
        ch::FilterOption.new(category.name, category.id, category.id == search_criteria[:category], category_counts[category.id])
        filter.add option
      end
      filters_collection.add filter
    end

  end

  def unbind(params, search_criteria)
  end
end