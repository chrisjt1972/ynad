module YNAB
  class ImportService < ::BaseService
    attr_reader :current_user

    def execute
      # Connect YNAB here.
      fetch_and_store_budgets
      fetch_and_store_categories
      fetch_and_store_accounts
      fetch_and_store_transactions
    end

    private

    def fetch_and_store_budgets
      BudgetsImportService.new(current_user).execute!
    end

    def fetch_and_store_categories
      CategoriesImportService.new(current_user).execute!
    end

    def fetch_and_store_accounts
      AccountsImportService.new(current_user).execute!
    end

    def fetch_and_store_transactions
      TransactionsImportService.new(current_user).execute!
    end
  end
end
