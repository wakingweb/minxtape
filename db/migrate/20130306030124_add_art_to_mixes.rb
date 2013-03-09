class AddArtToMixes < ActiveRecord::Migration
  def up
    add_column :mixes, :art, :string
  end
 
  def down
    remove_column :mixes, :art
  end
end
