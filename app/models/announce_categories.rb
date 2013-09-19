class AnnounceCategories < ActiveRecord::Base
  belongs_to :category
  belongs_to :announce
end
