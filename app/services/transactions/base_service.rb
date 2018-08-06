module Transactions
  class BaseService
    def initialize(account, params = {})
      @account = account
      @params = params.dup
    end
  end
end
