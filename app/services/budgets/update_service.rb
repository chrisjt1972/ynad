module Budgets
  class UpdateService < ::BaseService
    attr_reader :current_user, :params

    def change_primary
      budget = current_user.budgets.find(params[:id])

      # First, reset previous primary budget
      current_user.budgets.reset_primary

      # Then update
      budget.tap do |budget|
        budget.update!(primary: true)
      end

    rescue ActiveRecord::RecordInvalid => e
      fail(error: e.message, resource: budget)
    rescue StandardError => e
      fail(error: e.message, resource: budget)
    end
  end
end
