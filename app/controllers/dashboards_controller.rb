class DashboardsController < ApplicationController
  def show
    budget = if show_params[:budget_id]
               current_user.budgets.find(show_params[:budget_id])
             else
               current_user&.budgets&.first
             end
    @transactions = budget.accounts.map(&:transactions).flatten.select(&:within_90_days?) if budget
    @accounts = budget.accounts if budget
  end

  private

  def show_params
    params.permit(:budget_id)
  end
end
