require 'mongoid'

# Model of user
class User
  include Mongoid::Document
  include BCrypt

  field :email, type: String
  field :password, type: String
  field :nonce, type: String

  before_create :hash_password
  before_create :check_and_hash_password

  def self.authenticate(email, password)
    user = first(:conditions => {:email => email})
    if user && user.password == BCrypt::Engine.hash_secret(ENV['PASSWORD_SALT'] + password, user.nonce)
      user
    else
      nil
    end
  end

  private

  def hash_password
    self.nonce = BCrypt::Engine.generate_salt
    self.password = BCrypt::Engine.hash_secret(ENV['PASSWORD_SALT'] + self.password, self.nonce)
  end
end