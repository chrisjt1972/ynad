class Transaction < ApplicationRecord
  belongs_to :account

  validates_presence_of :ynab_id
  validates_uniqueness_of :ynab_id, scope: :account_id

  def current_month?
    date.between?(Time.now.beginning_of_month,
                  Time.now.end_of_month)
  end

  def last_week?
    date.between?(7.days.ago, Date.current)
  end

  def from_last_week
    select { |txn| txn.last_week? }
  end

  def within_90_days?
    date.between?(90.days.ago.beginning_of_month,
                  Time.now.end_of_month)
  end

  def expense?
    amount < 0
  end

  def income?
    amount > 0
  end

  def ynad_date
    date.strftime('%d %B')
  end
end
