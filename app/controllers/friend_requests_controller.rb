class FriendRequestsController < ApplicationController
  def new
    @friend_request = current_user.friend_requests.new
  end

  def create
    @friend_request = FriendRequests::CreateService.new(current_user, create_params).execute

    if @friend_request.sent?
      MailSchedulerJob.perform_later(friend_request_id: @friend_request.id)

      flash[:success] = "An email has been sent to #{@friend_request.email}"
      redirect_to root_path
    else
      flash[:notice] = "Something went wrong."
      render :new
    end
  end

  private

  def create_params
    params.require(:friend_request).permit(
      :email,
      :first_name,
      :last_name
    )
  end
end
