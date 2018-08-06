class CreateBudgetAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :budget_accounts do |t|
      t.belongs_to :budget, type: :uuid
      t.belongs_to :account, type: :uuid

      t.timestamps
    end
  end
end
