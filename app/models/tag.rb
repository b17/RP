class Tag < ActiveRecord::Base
  attr_accessible :img_url, :name
  belongs_to :announce
  belongs_to :news
end
