ThinkingSphinx::Index.define :announce, :with => :active_record do
  # fields
  indexes title
  indexes desc

  where "disabled = 0"

  # attributes
  has action_date, created_at, is_repeated
  has "RADIANS(lg)", :as => :longitude,  :type => :float
  has "RADIANS(lt)", :as => :latitude, :type => :float
  has announce_categories.category_id, :as => :category_id, :multi => true
  has announce_taggers.tag_id, :as => :tag_id, :multi => true
end
