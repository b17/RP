class News < ActiveRecord::Base
  attr_accessible :short_info, :title, :disabled, :content, :image, :tag_1, :tag_3, :tag_2, :disabled, :user_id, :lg, :lt, :created_at

  mount_uploader :image, NewsImageUploader

  belongs_to :user
  has_many :tags, :limit => 3


  before_save do |entity|
    entity.rewrite ||= StringHelper::urlize entity.title
  end

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

  def self.nearest_search(lg,lt,geo_distance,per_page)
    search '',
           :geo => [GeoHelper.to_rads(lt), GeoHelper.to_rads(lt)],
           :order => 'geodist ASC',
           :with => {:geodist => 0.0..GeoHelper.to_meters(geo_distance).to_f},
           :per_page => per_page


  end
end
