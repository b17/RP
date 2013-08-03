class Announce < ActiveRecord::Base
  attr_accessible :action_date, :desc, :lg, :lt, :title, :user_id, :disabled, :image, :tag_1, :tag_2, :tag_3
  belongs_to :user
  mount_uploader :image, AnnounceImageUploader
end
