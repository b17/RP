class Category < ActiveRecord::Base
  attr_accessible :name,:rewrite
  has_many :announce_categorieses
  has_many :announces, :through => :announce_category
end
