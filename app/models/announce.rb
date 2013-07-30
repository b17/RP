class Announce < ActiveRecord::Base
  attr_accessible :action_date, :desc, :lg, :lt, :title, :user_id, :disabled, :main_img_url, :tags
  has_many :tags
  belongs_to :user
end
