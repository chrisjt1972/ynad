class CategoryGroup < ApplicationRecord
  belongs_to :budget
  has_many :categories

  validates_uniqueness_of :ynab_id
  validates_presence_of :name, :ynab_id
end
