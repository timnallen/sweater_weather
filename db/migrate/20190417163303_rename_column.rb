class RenameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :locations, :query, :search_location
  end
end
