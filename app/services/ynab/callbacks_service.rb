module YNAB
  class CallbacksService
    def initialize(current_user, params)
      @current_user = current_user
      @params = params.dup
    end

    def execute
      fetch_code_from_params
      response = @current_user.fetch_access_token(@code)
      @current_user.update(ynab_access_token: response.dig('access_token'))

      @current_user
    end

    private

    def fetch_code_from_params
      @code = @params.dig('code')
    end
  end
end
