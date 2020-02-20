class AddCoordinatesToGameSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :game_sessions, :latitude, :float
    add_column :game_sessions, :longitude, :float
  end
end
