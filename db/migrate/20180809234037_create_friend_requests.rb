class CreateFriendRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_requests do |t|
      t.references :user, type: :uuid, foreign_key: true
      t.string :email

      t.timestamps
    end
  end
end
