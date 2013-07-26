class Announce < ActiveRecord::Base
  attr_accessible :action_date, :desc, :lg, :lt, :title, :user_id, :disabled
end
