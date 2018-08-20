class Budget < ApplicationRecord
  belongs_to :user
  has_many :category_groups, dependent: :destroy
  has_many :budget_accounts
  has_many :accounts, through: :budget_accounts, dependent: :destroy

  validates_uniqueness_of :ynab_id
  validates_presence_of :name, :ynab_id

  def self.primary
    primary_budgets = where(primary: true)

    if primary_budgets.any?
      primary_budgets.first
    else
      first.update!(primary: true)
      first
    end
  end

  def self.reset_primary
    primary.update!(primary: false)
  end
end
