class AddYnabIdToCategoryGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :category_groups, :ynab_id, :uuid
  end
end
