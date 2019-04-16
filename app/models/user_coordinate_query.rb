class UserCoordinateQuery < ApplicationRecord
  belongs_to :coordinate_query
  belongs_to :user
end
