class News < ActiveRecord::Base
  attr_accessible :name, :parent, :disabled, :content, :image
end
