class DashboardsController < ApplicationController
  def show
    @user = get_user_from_params
    budget = get_budget_from_params

    if budget
      @transactions = budget.accounts.map(&:transactions).flatten.select(&:within_90_days?)
      @accounts = budget.accounts
      @category_groups = budget.category_groups.without_ynab_internal_categories

      @user_current_month_income = @user.current_month_income
      @user_current_month_expense = @user.current_month_expense
      @net_worth = @user.net_worth
    end
  end

  private

  def get_user_from_params
    user = User.find_by(id: show_params[:user])
    return user if user

    if show_params[:user]&.downcase == 'all'
      # Do something
      return current_user
    end

    current_user
  end

  def get_budget_from_params
    if @user.budgets.any?
      if show_params[:budget_id]
        @user.budgets.find(show_params[:budget_id])
      else
        @user.primary_budget
      end
    end
  end

  def show_params
    params.permit(
      :budget_id,
      :user
    )
  end
end
