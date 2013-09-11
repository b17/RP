ThinkingSphinx::Index.define :announce, :with => :active_record do
  # fields
  indexes title
  indexes desc

  where "disabled = 0"

  # attributes
  has action_date, tag_1, tag_2, tag_3, created_at
  has "RADIANS(lg)",  :as => :longitude,  :type => :float
  has "RADIANS(lt)", :as => :latitude, :type => :float
end
