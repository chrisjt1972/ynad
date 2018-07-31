class CallbacksController < ApplicationController
  def new
    user = YNAB::CallbacksService.new(current_user, params).execute

    if user.blank? || !user.ynab_connected?
      flash[:danger] = 'Error connecting to YNAB.'
    else
      flash[:success] = 'YNAB has successfully connected. Your data will be imported shortly.'
    end

    redirect_to root_url
  end
end
