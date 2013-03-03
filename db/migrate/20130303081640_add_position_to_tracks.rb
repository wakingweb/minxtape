class AddPositionToTracks < ActiveRecord::Migration
  def up
    add_column :tracks, :position, :string
  end
 
  def down
    remove_column :tracks, :position
  end
end
