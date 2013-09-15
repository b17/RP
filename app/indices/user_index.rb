ThinkingSphinx::Index.define :users, :with => :active_record do
  # fields
  indexes name


  where "disabled = 0"

  # attributes
  has created_at
  has updated_at
end
