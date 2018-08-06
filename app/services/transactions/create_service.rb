module Transactions
  class CreateService < Transactions::BaseService
    attr_reader :account, :params

    def execute
      transaction = account.transactions.build(params)

      transaction.tap do |transaction|
        transaction.save!
      end

    rescue ActiveRecord::RecordInvalid => e
      fail(error: e.message)
    rescue StandardError => e
      fail(error: e.message)
    end
  end
end
