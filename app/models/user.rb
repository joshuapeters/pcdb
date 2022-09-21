class User < ApplicationRecord
  includes ActiveModel::SecurePassword
  has_secure_password

  has_many :user_contributions


  validates_presence_of :email, :username, :first_name, :last_name
  validates_uniqueness_of :email, :username
  validates_format_of :email, with: /\A(\S+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i
  validates_length_of :username, :email, :in => 4..50
end
