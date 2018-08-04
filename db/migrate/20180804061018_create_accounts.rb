class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts, id: :uuid do |t|
      t.string :name
      t.string :type
      t.boolean :on_budget, default: false
      t.boolean :closed, default: false
      t.decimal :balance
      t.decimal :cleared_balance
      t.decimal :uncleared_balance

      t.timestamps
    end
  end
end
