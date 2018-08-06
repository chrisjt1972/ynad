class Transaction < ApplicationRecord
  belongs_to :account

  def current_month?
    date.between?(Time.now.beginning_of_month,
                  Time.now.end_of_month)
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
end
