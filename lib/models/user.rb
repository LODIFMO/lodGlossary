require 'mongoid'
require 'bcrypt'

# Model of user
class User
  include Mongoid::Document
  include BCrypt

  field :email, type: String
  field :password, type: String
  field :password_hash, type: String
  field :token, type: String

  # before_create :hash_password

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate?(email, password)
    user = User.find_by(email: email)
    user.password == password
  end
end