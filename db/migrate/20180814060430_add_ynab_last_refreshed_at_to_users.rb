class AddYnabLastRefreshedAtToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ynab_last_refreshed_at, :datetime
  end
end
