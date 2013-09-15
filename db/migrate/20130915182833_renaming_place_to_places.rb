class RenamingPlaceToPlaces < ActiveRecord::Migration
  def up
    rename_table :place, :places
  end

  def down
    rename_table :places, :place
  end
end
