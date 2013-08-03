class Tag < ActiveRecord::Base
  attr_accessible :image, :name
  mount_uploader :image, TagUploader
end
