class Tag < ActiveRecord::Base
  attr_accessible :image, :name, :disabled ,:rewrite

has_many :announce_taggers
has_many :announces, :through => :announce_taggers

  has_many :news_taggers
  has_many :news, :through => :news_taggers


  mount_uploader :image, TagUploader

  before_save do |entity|
    entity.rewrite ||= StringHelper::urlize entity.name
  end

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
