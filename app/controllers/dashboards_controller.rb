class DashboardsController < ApplicationController
  def show
    @transactions = current_user.transactions.select(&:within_90_days?)
  end
end
