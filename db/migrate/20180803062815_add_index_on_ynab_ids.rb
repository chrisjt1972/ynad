class AddIndexOnYnabIds < ActiveRecord::Migration[5.2]
  def change
    add_index :budgets, :ynab_id
    add_index :categories, :ynab_id
    add_index :category_groups, :ynab_id
  end
end
