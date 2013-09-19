ThinkingSphinx::Index.define :user, :with => :active_record do
  # fields
  indexes first
  indexes last
  indexes role


  where "disabled = 0"

  # attributes
  has created_at
  has updated_at
end
