class News < ActiveRecord::Base
  attr_accessible :short_info, :title, :disabled, :content, :image, :tag_1, :tag_3, :tag_2, :disabled, :user_id, :lg, :lt, :created_at
  belongs_to :user
  mount_uploader :image, NewsImageUploader


  def short_desc
    shorter 240, short_info
  end

  def title_feed
    shorter 24, title
  end

  def title_resize(length)
    shorter length, title
  end

  def self.active
    where(:disabled => false)
  end

  def self.disabled
    where(:disabled => true)
  end

  private
  def shorter(length, field)
    string_arr = field.split(//)
    field.length > length ? "#{string_arr[0..(length-1)].join('')}..." : field
  end

  def self.locale(longitude, latitude, limit)

    one_km_dist=0.009 #constant, hand made
    radius=30 #km
    where(:disabled => false).order('created_at DESC').limit(3)
    half_of_bounds=(one_km_dist*radius)/2
    lg1 = longitude.to_f-half_of_bounds
    lg2 = longitude.to_f+half_of_bounds
    lt1 = latitude.to_f-half_of_bounds
    lt2 = latitude.to_f+half_of_bounds
    all(:conditions => {:lg => (lg1..lg2), :lt => (lt1..lt2), :disabled => false, }, :limit => limit.to_i)
  end
end
