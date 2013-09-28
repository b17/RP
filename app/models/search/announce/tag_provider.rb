class Search::Announce::TagProvider < Search::Provider
  def request_param_name
    @request_param_name ||= :tag
  end

  def bind(params, search_criteria)
    if params[request_param_name].kind_of? Array
      search_criteria[:tag] = params[request_param_name].map {|i| i.to_i}
    end
  end

  def apply(query, search_criteria)
    query[:with][:tag_id] = search_criteria[:tag] if search_criteria[:tag]
  end

  def filters(where, search_criteria, filters_collection)
    where[:group_by] = 'tag_id'
    where[:order] = '@count DESC'

    where[:with].delete :tag_id

    search_criteria[:tag] ||= []

    tags_count = {}
    sphinx_result = @layer.query_raw(where)
    sphinx_result.each do |row|
      tags_count[row['@groupby']] = row['@count']
    end

    if tags_count.length > 0
      filter = Search::ListFilter.new I18n::t(:filter_tag), request_param_name, :multi => true
      tags = Tag.select('id, name').where({:id => tags_count.keys}).order('FIELD(id, %{ids})' % {:ids => tags_count.keys.join(',')})
      tags.each do |tag|
        option = Search::Announce::FilterOption.new(tag.name, tag.id, search_criteria[:tag].include?(tag.id), tags_count[tag.id])
        filter.add option
      end
      filters_collection.add :tags, filter
    end
  end
end