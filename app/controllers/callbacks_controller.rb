class CallbacksController < ApplicationController
  def new
    user = YNAB::CallbacksService.new(current_user, params).execute

    if user.blank? || !user.ynab_connected?
      flash[:danger] = 'Error connecting to YNAB.'
    else
      YNABImportJob.perform_later(user_id: current_user.id)

      flash[:success] = I18n.t(
        'messages.ynab.connection_successful'
      )
    end

    redirect_to root_url
  end
end
