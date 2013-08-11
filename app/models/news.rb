class News < ActiveRecord::Base
  attr_accessible :short_info, :title, :disabled, :content, :image, :tag_1, :tag_3, :tag_2, :disabled, :user_id, :lg, :lt
  belongs_to :user
  mount_uploader :image, NewsImageUploader
end
