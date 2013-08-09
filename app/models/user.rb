class User < ActiveRecord::Base
  attr_accessible :e_mail, :first, :last, :login, :password
  has_many :announces


end
