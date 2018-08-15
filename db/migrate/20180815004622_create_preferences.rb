class CreatePreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :preferences do |t|
      t.boolean :graph_point_enabled, default: true
      t.belongs_to :user

      t.timestamps
    end
  end
end
