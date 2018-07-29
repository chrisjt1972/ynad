class AddYnabAccessTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ynab_acces_token, :string
  end
end
