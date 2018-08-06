class Transaction < ApplicationRecord
  belongs_to :account

  def current_month?
    date.between?(Time.now.last_month.beginning_of_month,
                  Time.now.last_month.end_of_month)
  end

  def expense
    amount < 0
  end

  def income?
    amount > 0
  end
end
