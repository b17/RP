class News < ActiveRecord::Base
  attr_accessible :short_info, :title, :disabled, :content, :image, :tag_1, :tag_3, :tag_2, :disabled, :user_id, :lg, :lt, :created_at
  belongs_to :user
  mount_uploader :image, NewsImageUploader


  def short_desc
    shorter 240, short_info
  end

  def feed_title
    shorter 24, title
  end

  def shorter(length, field)
    string_arr = field.split(//)
    field.length > length ? "#{string_arr[0..(length-1)].join('')}..." : field
  end
end
