class RenameColumnInUserCoordinateQueries < ActiveRecord::Migration[5.2]
  def change
    rename_column :user_locations, :coordinate_query_id, :location_id
  end
end
