class FiltersController < ApplicationController
  def index
    redirect_to root_path if index_params[:user].downcase != 'all'

    @user = user_and_friends
    budgets = @user.map(&:primary_budget)

    @transactions = budgets.
      map(&:accounts).flatten.
      map(&:transactions).flatten.
      select(&:within_90_days?)

    @accounts = budgets.map(&:accounts).flatten
    @category_groups = budgets.
      map(&:category_groups).
      map(&:without_ynab_internal_categories).flatten

    @user_current_month_income = @user.map(&:current_month_income).compact.sum
    @user_current_month_expense = @user.map(&:current_month_expense).compact.sum
    @net_worth = @user.map(&:net_worth).compact.sum
    #
    # @last_week_income = @transactions.select(&:last_week?).select(&:income?).
    #   sort_by(&:date).reverse
    # @last_week_expense = @transactions.select(&:last_week?).select(&:expense?).
    #   sort_by(&:date).reverse
    #
    render template: 'dashboards/show'
  end

  private

  def index_params
    params.permit(:user)
  end

  def user_and_friends
    [current_user, current_user.friends.to_a].flatten
  end
end
