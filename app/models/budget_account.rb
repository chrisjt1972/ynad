class BudgetAccount < ApplicationRecord
  belongs_to :budget, inverse_of: :budget_accounts
  belongs_to :account, inverse_of: :budget_accounts
end
