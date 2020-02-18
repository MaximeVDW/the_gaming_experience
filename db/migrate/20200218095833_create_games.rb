class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.string :description
      t.string :category
      t.integer :min_player
      t.integer :max_player

      t.timestamps
    end
  end
end
