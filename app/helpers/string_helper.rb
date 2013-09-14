module StringHelper
  def self.translit(string, target_language = :english)
    Translit::convert(string, target_language)
  end

  def self.urlize(string)
    translit(string.strip, :english).gsub(/\s+/, '-').gsub(/[^\w\d-]/ui, '').downcase
  end
end
