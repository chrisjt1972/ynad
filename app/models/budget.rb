class Budget < ApplicationRecord
  belongs_to :user

  validates_uniqueness_of :ynab_id
end
