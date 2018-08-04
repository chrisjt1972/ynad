class CreateCategoryGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :category_groups do |t|
      t.string :name
      t.boolean :hidden, default: false
      t.belongs_to :budget, type: :uuid

      t.timestamps
    end
  end
end
