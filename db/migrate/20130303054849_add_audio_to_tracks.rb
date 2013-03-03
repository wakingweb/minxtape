class AddAudioToTracks < ActiveRecord::Migration  
  def up
    add_column :tracks, :audio, :string
  end
 
  def down
    remove_column :tracks, :audio
  end
end
