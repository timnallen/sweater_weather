class RenameCoordinateQueriesToLocations < ActiveRecord::Migration[5.2]
  def change
    rename_table :coordinate_queries, :locations
  end
end
