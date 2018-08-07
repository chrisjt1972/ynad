class AddRefreshCountToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :refresh_count, :integer, default: 0
  end
end
