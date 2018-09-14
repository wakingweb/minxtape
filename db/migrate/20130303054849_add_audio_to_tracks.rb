class AddAudioToTracks < ActiveRecord::Migration[4.2]
  def up
    add_column :tracks, :audio, :string
  end

  def down
    remove_column :tracks, :audio
  end
end
