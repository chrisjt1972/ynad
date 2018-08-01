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
end
