module YNAB
  class BaseService < ::BaseService
    def client
      @client ||= YNAB::API.new(current_user.ynab_access_token)
    end
  end
end
