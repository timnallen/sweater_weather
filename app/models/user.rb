class User < ApplicationRecord
  validates_presence_of :email
  validates_uniqueness_of :email
  has_secure_password

  has_many :user_locations
  has_many :locations, through: :user_locations
end
