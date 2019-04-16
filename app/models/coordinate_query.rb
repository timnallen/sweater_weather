class CoordinateQuery < ApplicationRecord
  has_many :user_coordinate_queries
  has_many :users, through: :user_coordinate_queries
end
