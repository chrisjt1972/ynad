class CallbacksController < ApplicationController
  def new
    fetch_code_from_params
    response = current_user.fetch_access_token(@code)
    current_user.update(ynab_access_token: response.dig('access_token'))

    redirect_to root_url
  end

  private

  def fetch_code_from_params
    @code = params.dig('code')
  end
end
