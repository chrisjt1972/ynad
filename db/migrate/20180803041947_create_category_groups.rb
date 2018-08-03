class CreateCategoryGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :category_groups, id: :uuid do |t|
      t.string :name
      t.boolean :hidden, default: false
      t.belongs_to :budget

      t.timestamps
    end
  end
end
