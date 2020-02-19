class ChangeDescriptionGameToText < ActiveRecord::Migration[5.2]
  def change
    change_column :games, :description, :text
  end
end
