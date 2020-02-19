class AddDescriptionToGameSession < ActiveRecord::Migration[5.2]
  def change
    add_column :game_sessions, :description, :string
  end
end
