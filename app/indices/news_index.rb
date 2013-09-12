ThinkingSphinx::Index.define :news, :with => :active_record do
  # fields
  indexes title
  indexes content

  where "disabled = 0"

  # attributes
  has created_at
  has "RADIANS(lg)",  :as => :longitude,  :type => :float
  has "RADIANS(lt)", :as => :latitude, :type => :float
end
