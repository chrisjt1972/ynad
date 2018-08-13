class BudgetsController < ApplicationController
  def update
    @budget = Budgets::UpdateService.new(current_user, update_params).change_primary

    respond_to do |format|
      format.js { render template: 'settings/budgets.js.erb' }
    end
  end

  private

  def update_params
    params.permit(:id)
  end
end
