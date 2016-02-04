class ChangeTracksPositionColumnToInteger < ActiveRecord::Migration
  def up
    change_column :tracks, :position, 'integer USING CAST(position AS integer)'
  end

  def down
    change_column :tracks, :position, :string
  end
end
