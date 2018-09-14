class AddSlugToMixes < ActiveRecord::Migration[4.2]
  def change
    add_column :mixes, :slug, :string
    add_index :mixes, :slug, unique: true
  end
end
