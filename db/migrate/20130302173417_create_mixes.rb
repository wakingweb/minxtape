class CreateMixes < ActiveRecord::Migration[4.2]
  def change
    create_table :mixes do |t|
      t.string :title
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
