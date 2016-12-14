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

  before_create :hash_password

  def password
    self['password'] ||= Password.new(password_hash)
  end

  def hash_password
    self['password'] = Password.create(self['password'])
    self.password_hash = self['password']
  end

  def self.authenticate?(email, password)
    user = User.find_by_email(email)
    user.password == password
  end
end