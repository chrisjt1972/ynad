class YnabImportsController < ApplicationController
  def create
    YNABImportJob.perform_later(user_id: current_user.id)

    redirect_to root_path
  end
end
