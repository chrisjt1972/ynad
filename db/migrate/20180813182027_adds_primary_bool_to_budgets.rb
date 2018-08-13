class AddsPrimaryBoolToBudgets < ActiveRecord::Migration[5.2]
  def change
    add_column :budgets, :primary, :boolean, default: false
  end
end
