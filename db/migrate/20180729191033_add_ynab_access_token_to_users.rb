class AddYnabAccessTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ynab_access_token, :string
  end
end
