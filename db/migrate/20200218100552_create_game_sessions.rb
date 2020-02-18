class CreateGameSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :game_sessions do |t|
      t.references :game, foreign_key: true
      t.date :date
      t.boolean :booked, default: false
      t.integer :price
      t.references :creator
      t.references :player

      t.timestamps
    end
  end
end
