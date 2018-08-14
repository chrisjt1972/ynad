class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name

  YNAB_API_LIMIT = 200

  has_many :budgets

  # Friends
  has_many :friend_requests, dependent: :destroy
  has_many :friendships
  has_many :friends, through: :friendships

  def update_refresh_count!
    self.refresh_count += 1
    self.save!
  end

  def ynab_api_limit_reached?
    refresh_count >= YNAB_API_LIMIT
  end

  def ynab_connected?
    self.ynab_access_token.present?
  end

  def ynab_oauth_url
    ::OAuth::YNAB::Client.new.authorization_url
  end

  def primary_budget
    budgets.primary
  end

  def fetch_access_token(code)
    ::OAuth::YNAB::Client.new.fetch_access_token(code)
  end

  def accounts
    primary_budget.accounts
  end

  def current_month_expense
    accounts.map(&:transactions).flatten.select do |transaction|
      transaction.current_month? && transaction.expense?
    end.flatten.sum(&:amount).abs / 1000
  end

  def current_month_income
    accounts.map(&:transactions).flatten.select do |transaction|
      transaction.current_month? && transaction.income?
    end.flatten.sum(&:amount) / 1000
  end

  def transactions
    accounts.map(&:transactions).flatten
  end

  def net_worth
    accounts.sum(&:balance) / 1000
  end
end
