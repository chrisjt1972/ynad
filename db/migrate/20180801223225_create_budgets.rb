class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets, id: :uuid do |t|
      t.string :name
      t.uuid :ynab_id
      t.belongs_to :user, type: :uuid

      t.timestamps
    end
  end
end
