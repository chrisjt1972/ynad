class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions  do |t|
      t.datetime :date
      t.decimal :amount
      t.string :cleared
      t.boolean :approved
      t.belongs_to :account, type: :uuid
      t.boolean :deleted

      t.timestamps
    end
  end
end
