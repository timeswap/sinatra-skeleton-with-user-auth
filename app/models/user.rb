# require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt

  validates :user_name, presence: true
  validates :email, uniqueness: true
  validates :password_hash, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(email_input, password_input)
    self.email == email_input && self.password == password_input
  end

end
