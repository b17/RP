class StringUtil
  def new
    self
  end

  public
  def words_limit(text, limit)
    string_arr = text.split(//)
    text.length > limit ? "#{string_arr[0..(limit-1)].join('')}..." : text
  end
end