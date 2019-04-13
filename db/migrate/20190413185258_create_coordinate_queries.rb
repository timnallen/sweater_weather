class CreateCoordinateQueries < ActiveRecord::Migration[5.2]
  def change
    create_table :coordinate_queries do |t|
      t.float :latitude
      t.float :longitude
      t.string :query

      t.timestamps
    end
  end
end
