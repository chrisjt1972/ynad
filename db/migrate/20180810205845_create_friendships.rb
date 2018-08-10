class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :user, type: :uuid, foreign_key: true
      t.references :friend, type: :uuid, index: true

      t.timestamps
    end
  end
end
