class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name

  YNAB_API_LIMIT = Rails.env.development? ? 200 : 5

  # Budgets
  has_many :budgets, dependent: :destroy

  # Friends
  has_many :friend_requests, dependent: :destroy
  has_many :friendships
  has_many :friends, through: :friendships, dependent: :destroy

  # Preference
  has_one :preference

  # Callbacks
  after_create :setup_user_preference

  def update_refresh_count!
    self.refresh_count += 1
    self.ynab_last_refreshed_at = Time.current
    self.save!
  end

  def ynab_api_limit_reached?
    refresh_exceeds_limit? &&
      !last_refresh_performed_more_than_an_hour_ago?
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

  def full_name
    "#{first_name} #{last_name}"
  end

  def disconnect_ynab
    update(ynab_access_token: nil)
  end

  private

  def refresh_exceeds_limit?
    refresh_count >= YNAB_API_LIMIT
  end

  def last_refresh_performed_more_than_an_hour_ago?
    ynab_last_refreshed_at <= 1.hour.ago
  end

  def setup_user_preference
    self.create_preference
  end
end
