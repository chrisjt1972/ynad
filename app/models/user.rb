class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :budgets

  def ynab_connected?
    self.ynab_access_token.present?
  end

  def ynab_oauth_url
    ::OAuth::YNAB::Client.new.authorization_url
  end

  def fetch_access_token(code)
    ::OAuth::YNAB::Client.new.fetch_access_token(code)
  end

  def accounts
    budgets.map(&:accounts).flatten
  end

  def current_month_expense
    accounts.map(&:transactions).flatten.select do |transaction|
      transaction.current_month? && transaction.expense
    end.flatten.sum(&:amount) / 1000
  end

  def current_month_income
    accounts.map(&:transactions).flatten.select do |transaction|
      transaction.current_month? && transaction.income?
    end.flatten.sum(&:amount) / 1000
  end
end
