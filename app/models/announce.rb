class Announce < ActiveRecord::Base
  attr_accessible :action_date, :desc, :lg, :lt, :title, :user_id, :disabled, :image, :tag_1, :tag_2, :tag_3
  belongs_to :user
  mount_uploader :image, AnnounceImageUploader


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
    one_km_dist=0.009 #constant, hand made
    radius=10 #km
    half_of_bounds=(one_km_dist*radius)/2
    lg1 = longitude.to_f-half_of_bounds
    lg2 = longitude.to_f+half_of_bounds
    lt1 = latitude.to_f-half_of_bounds
    lt2 = latitude.to_f+half_of_bounds
    all(:conditions => {:lg => (lg1..lg2), :lt => (lt1..lt2), :disabled => false, }, :limit => limit.to_i)
  end


  def self.active_by_id(id)
    where(:user_id => id, :disabled => false)
  end

  def self.views
     AddAnnounceAccounting
  end
end
