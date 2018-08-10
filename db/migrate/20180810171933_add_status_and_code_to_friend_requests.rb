class AddStatusAndCodeToFriendRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :friend_requests, :code, :string
    add_column :friend_requests, :status, :string
  end
end
