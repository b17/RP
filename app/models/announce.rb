class Announce < ActiveRecord::Base
  attr_accessible :action_date, :desc, :lg, :lt, :title, :user_id, :disabled, :image, :tag_1, :tag_2, :tag_3
  belongs_to :user
  mount_uploader :image, AnnounceImageUploader


  def feed_title
    shorter 24, title
  end

  def shorter(length, field)
    string_arr = field.split(//)
    field.length > length ? "#{string_arr[0..(length-1)].join('')}..." : field
  end
end
