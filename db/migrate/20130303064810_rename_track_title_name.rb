class RenameTrackTitleName < ActiveRecord::Migration
  def up
    rename_column :tracks, :title, :name
  end

  def down
    rename_column :tracks, :name, :title
  end
end
