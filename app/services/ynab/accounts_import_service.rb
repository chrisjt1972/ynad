module YNAB
  class AccountsImportService < YNAB::BaseService
    attr_reader :current_user

    def execute!
      current_user.budgets.each do |budget|
        accounts_response = client.accounts.get_accounts(budget.ynab_id)
        accounts = accounts_response.data.accounts

        accounts.each do |account|
          next if account_exists?(account)
          Accounts::CreateService.new(
            budget,
            account_params(account)
          ).execute
        end
      end
    end

    private

    def account_params(ynab_account)
      {
        ynab_id: ynab_account.id,
        name: ynab_account.name,
        on_budget: ynab_account.on_budget,
        kind: ynab_account.type,
        closed: ynab_account.closed,
        balance: ynab_account.balance,
        cleared_balance: ynab_account.cleared_balance,
        uncleared_balance: ynab_account.uncleared_balance
      }
    end

    def account_exists?(ynab_account)
      ::Account.find_by(ynab_id: ynab_account.id).present?
    end
  end
end
