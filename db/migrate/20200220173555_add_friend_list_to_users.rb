class AddFriendListToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :friend_list, :text, default: ""
  end
end
