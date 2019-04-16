class AddColumnsToCoordinateQueries < ActiveRecord::Migration[5.2]
  def change
    add_column :coordinate_queries, :location_name, :string
    add_column :coordinate_queries, :country, :string
  end
end
