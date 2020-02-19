class ChangeDescriptionToText < ActiveRecord::Migration[5.2]
  def change
    change_column :game_sessions, :description, :text
  end
end
