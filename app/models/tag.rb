class Tag < ActiveRecord::Base
  attr_accessible :image, :name, :disabled
  mount_uploader :image, TagUploader

  def self.active
    where :disabled => false
  end

  def self.disabled
    where :disabled => true
  end

  def name_resize(length)
    shorter length, name
  end

  def shorter(length, field)
    string_arr = field.split(//)
    field.length > length ? "#{string_arr[0..(length-1)].join('')}..." : field
  end

end
