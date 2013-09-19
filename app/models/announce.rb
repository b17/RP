class Announce < ActiveRecord::Base
  attr_accessible :action_date, :desc, :lg, :lt, :title, :user_id, :disabled, :image, :tag_1, :tag_2, :tag_3

  mount_uploader :image, AnnounceImageUploader

  has_many :announce_taggers
  has_many :tags, :through => :announce_taggers

  before_save do |entity|
    entity.rewrite ||= StringHelper::urlize entity.title
  end

  def title_feed
    shorter 24, title
  end

  def title_resize(length)
    shorter length, title
  end

  def shorter(length, field)
    string_arr = field.split(//)
    field.length > length ? "#{string_arr[0..(length-1)].join('')}..." : field
  end

  def self.active
    where :disabled => false
  end

  def self.disabled
    where :disabled => true
  end

  def self.locale(longitude, latitude, limit)
    search '', :geo => [longitude, latitude]
  end


  def self.active_by_id(id)
    where(:user_id => id, :disabled => false)
  end

  def self.views
     AddAnnounceAccounting
  end

  def self.nearest_search(lg,lt,geo_distance,per_page)
    search '',
           :geo => [GeoHelper.to_rads(lt), GeoHelper.to_rads(lt)],
           :order => 'geodist ASC',
           :with => {:geodist => 0.0..GeoHelper.to_meters(geo_distance).to_f},
           :per_page => per_page
  end

end
