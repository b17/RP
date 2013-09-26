class Search::Common::GeoDistanceProvider < Search::Provider

  def bind(params, search_criteria)
    if params.key? :distance
      search_criteria[:geo] = {
          :distance => params[:distance].to_f,
          :latitude => (params[:latitude] || 0).to_f,
          :longitude => (params[:longitude] || 0).to_f
      }
    end
  end

  def filters(where, search_criteria, filters_collection)
    if search_criteria.key? :geo
      where[:with].delete(:distance)
    end
  end

  def apply(query, search_criteria)
    if search_criteria.key? :geo
      geo = search_criteria[:geo]
      query[:geo] = [geo[:latitude], geo[:longitude]]
      query[:with] ||= {}
      query[:with][:geodist] = 0.0..geo[:distance]
    end
  end
end