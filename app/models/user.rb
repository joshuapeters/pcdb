class User < ApplicationRecord
  includes ActiveModel::SecurePassword
  has_secure_password

  has_many :user_contributions

  # validates_presence_of :email, :username, :first_name, :last_name
  # validates_uniqueness_of :email, :username
  #
  # validates_format_of :email, with: '/\A([^\s]+)((?:[-a-z0-9]\.)[a-z]', on: :create
  # validates_length_of :username, :email, in: 4..50, on: :create
  scope :find_by_username, -> (username) { find_by(username: username) }
  scope :find_by_email, -> (email) { find_by(email: email) }
end
