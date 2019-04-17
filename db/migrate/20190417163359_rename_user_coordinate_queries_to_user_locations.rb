class RenameUserCoordinateQueriesToUserLocations < ActiveRecord::Migration[5.2]
  def change
    rename_table :user_coordinate_queries, :user_locations
  end
end
