class Tag < ActiveRecord::Base
  attr_accessible :image, :name, :disabled
  mount_uploader :image, TagUploader

  def self.active
    where :disabled => false
  end

  def self.disabled
    where :disabled => true
  end
end
