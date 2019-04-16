class User < ApplicationRecord
  validates_presence_of :email
  validates_uniqueness_of :email
  has_secure_password

  has_many :user_coordinate_queries
  has_many :coordinate_queries, through: :user_coordinate_queries
end
