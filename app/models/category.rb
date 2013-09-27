class Category < ActiveRecord::Base
  attr_accessible :name,:rewrite,:disabled

  has_many :announce_categorieses
  has_many :announces, :through => :announce_categorieses

  before_save do |entity|
    entity.rewrite ||= StringHelper::urlize entity.name
  end


  def self.active
    where :disabled => false
  end
end
