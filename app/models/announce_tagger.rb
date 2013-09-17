class AnnounceTagger < ActiveRecord::Base
belongs_to :announce
belongs_to :tag
end
