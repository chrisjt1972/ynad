class Budget < ApplicationRecord
  belongs_to :user
  has_many :category_groups
  has_many :budget_accounts
  has_many :accounts, through: :budget_accounts

  validates_uniqueness_of :ynab_id
  validates_presence_of :name, :ynab_id

  scope :primary, -> { where(primary: true).first }
end
