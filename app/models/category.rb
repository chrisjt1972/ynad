class Category < ApplicationRecord
  belongs_to :category_group

  validates_uniqueness_of :ynab_id
  validates_presence_of :name, :ynab_id, :budgeted_amount, :activity_amount
end
