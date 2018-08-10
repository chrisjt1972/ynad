class AddFirstAndLastNamesToFriendRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :friend_requests, :first_name, :string
    add_column :friend_requests, :last_name, :string
  end
end
