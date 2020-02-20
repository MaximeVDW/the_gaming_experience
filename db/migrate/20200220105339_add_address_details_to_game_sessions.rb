class AddAddressDetailsToGameSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :game_sessions, :street, :string
    add_column :game_sessions, :street_number, :string
    add_column :game_sessions, :postal_code, :string
    add_column :game_sessions, :address, :string
  end
end
