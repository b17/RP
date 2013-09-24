ThinkingSphinx::Index.define :announce, :with => :active_record do
  # fields
  indexes title
  indexes desc

  where "disabled = 0"

  # attributes
  has action_date, created_at
  has "RADIANS(lg)",  :as => :longitude,  :type => :float
  has "RADIANS(lt)", :as => :latitude, :type => :float
  #has "announce_taggers__category_id", :as => :category_id, :multi => true
end
