class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets, id: :uuid do |t|
      t.string :name
      t.string :ynab_id
      t.belongs_to :user

      t.timestamps
    end
  end
end
