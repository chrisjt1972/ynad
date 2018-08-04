class BudgetAccount < ApplicationRecord
  belongs_to :budget
  belongs_to :account
end
