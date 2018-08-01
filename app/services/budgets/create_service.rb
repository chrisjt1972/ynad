module Budgets
  class CreateService < ::BaseService
    attr_reader :current_user, :params

    def execute
      budget = current_user.budgets.build(params)

      budget.tap do |budget|
        budget.save!
      end

    rescue ActiveRecord::RecordInvalid => e
      fail(error: e.message, resource: budget)
    rescue StandardError => e
      fail(error: e.message, resource: budget)
    end
  end
end
