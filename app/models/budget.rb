class Budget < ApplicationRecord
  belongs_to :user
  has_many :category_groups

  validates_uniqueness_of :ynab_id
end
