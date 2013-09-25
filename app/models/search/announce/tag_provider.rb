class Search::Announce::TagProvider < Search::Provider
  def request_param_name
    @request_param_name ||= :tag
  end

  def bind(params, search_criteria)
    if params.key? request_param_name
      search_criteria[request_param_name] = params[:tag].to_i
    end
  end

  def apply(query, search_criteria)
    if search_criteria.key? :tag
      query[:with][:tag_id] = search_criteria[:category]
    end
  end

  def filters(where, search_criteria, filters_collection)
    where[:group_by] = 'tag_id'
    where[:order_by] = '@count DESC'

    tags_count = {}

    # We can't get category id and name directly from sphinx response (Many-to-Many)
    # So we collect counts and category ids from sphinx
    # And then perform SQL query to the DB.
    sphinx_result = @layer.query(where).raw()
    sphinx_result.each do |row|
      tags_count[row['@groupby']] = row['@count']
    end

    if tags_count.length
      filter = Search::Filter.new(I18n::t(:filter_tag), request_param_name)
      tags = Tag.select('id, name').where({:id => tags_count.keys}).order('FIELD(id, %{ids})' % {:ids => tags_count.keys.join(',')})
      tags.each do |tag|
        option = Search::FilterOption.new(tag.name, tag.id, tag.id == search_criteria[:tag], tags_count[tag.id])
        filter.add option
      end
      filters_collection.add filter
    end
  end
end