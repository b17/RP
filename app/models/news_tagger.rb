class NewsTagger < ActiveRecord::Base
  belongs_to :news
  belongs_to :tag
end
