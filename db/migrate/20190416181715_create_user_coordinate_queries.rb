class CreateUserCoordinateQueries < ActiveRecord::Migration[5.2]
  def change
    create_table :user_coordinate_queries do |t|
      t.references :user, foreign_key: true
      t.references :coordinate_query, foreign_key: true
    end
  end
end
