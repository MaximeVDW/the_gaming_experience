class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :phone_number, :string
    add_column :users, :bank_info, :string
    add_column :users, :street, :string
    add_column :users, :street_number, :string
    add_column :users, :postal_code, :string
    add_column :users, :city, :string
  end
end
