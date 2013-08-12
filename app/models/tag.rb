class Tag < ActiveRecord::Base
  attr_accessible :image, :name, :disabled
  mount_uploader :image, TagUploader
end
