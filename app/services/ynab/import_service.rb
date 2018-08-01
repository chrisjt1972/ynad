module YNAB
  class ImportService < BaseService
    attr_reader :current_user

    def execute
      # Connect YNAB here.
      fetch_and_store_budgets
    end

    private

    def fetch_and_store_budgets
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

    def client
      @client ||= YNAB::API.new(current_user.ynab_access_token)
    end

    def budget_exists?(budget)
      Budget.find_by(ynab_id: budget.id).present?
    end
  end
end
