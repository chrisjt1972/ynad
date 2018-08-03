class AddYnabIdToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :ynab_id, :string
  end
end
