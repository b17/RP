class User < ActiveRecord::Base
  validates :login, uniqueness: {:message => 'This login is already taken.'}
  attr_accessible :e_mail, :first, :last, :login, :password_hash

  before_save :encrypt_password

  attr_accessor :password

  has_many :announces
  has_many :news

  def self.authenticate(login, password)
    user = find_by_login login
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
