class AddSlugToMixes < ActiveRecord::Migration
  def change
    add_column :mixes, :slug, :string
    add_index :mixes, :slug, unique: true
  end
end
