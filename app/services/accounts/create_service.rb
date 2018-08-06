module Accounts
  class CreateService < Accounts::BaseService
    attr_reader :budget, :params

    def execute
      account = budget.accounts.build(params)

      account.tap do |account|
        account.save!
      end

    rescue ActiveRecord::RecordInvalid => e
      fail(error: e.message)
    rescue StandardError => e
      fail(error: e.message)
    end
  end
end
