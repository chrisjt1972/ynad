module YNAB
  class BudgetsImportService < YNAB::BaseService
    attr_reader :current_user

    def execute!
      budget_response = client.budgets.get_budgets
      budgets = budget_response.data.budgets

      budgets.each do |budget|
        next if budget_exists?(budget)

        Budgets::CreateService.new(
          current_user,
          {name: budget.name, ynab_id: budget.id}
        ).execute
      end
    end

    private

    def budget_exists?(budget)
      Budget.find_by(ynab_id: budget.id).present?
    end
  end
end
