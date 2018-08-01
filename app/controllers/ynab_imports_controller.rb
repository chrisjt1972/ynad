class YnabImportsController < ApplicationController
  def create
    # TODO: Uncomment this when done testing and remove direct call to import
    # service.
    # YNABImportJob.perform_later(user_id: current_user.id)
    YNAB::ImportService.new(current_user).execute

    redirect_to root_path
  end
end
