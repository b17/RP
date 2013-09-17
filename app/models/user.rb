class User < ActiveRecord::Base
  validates :login, uniqueness: {:message => 'This login is already taken.'}
  attr_accessible :e_mail, :first, :last, :login, :password
  has_many :announces
  has_many :news
end
