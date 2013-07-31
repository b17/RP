class Announce < ActiveRecord::Base
  attr_accessible :action_date, :desc, :lg, :lt, :title, :user_id, :disabled, :main_img_url, :tag_1, :tag_2, :tag_3
  belongs_to :user
end
