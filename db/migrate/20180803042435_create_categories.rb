class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.boolean :hidden, default: false
      t.decimal :budgeted_amount
      t.decimal :activity_amount
      t.belongs_to :category_group

      t.timestamps
    end
  end
end
