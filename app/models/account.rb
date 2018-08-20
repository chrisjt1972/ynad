class Account < ApplicationRecord
  has_many :budget_accounts
  has_many :budgets, through: :budget_accounts, dependent: :destroy

  has_many :transactions, dependent: :destroy
end
