class AddYnabIdToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :ynab_id, :uuid
  end
end
