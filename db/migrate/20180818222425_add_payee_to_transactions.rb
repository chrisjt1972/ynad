class AddPayeeToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :payee, :string
  end
end
