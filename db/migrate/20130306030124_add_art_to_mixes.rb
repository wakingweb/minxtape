class AddArtToMixes < ActiveRecord::Migration[4.2]
  def up
    add_column :mixes, :art, :string
  end
 
  def down
    remove_column :mixes, :art
  end
end
