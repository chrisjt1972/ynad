class FriendRequestsController < ApplicationController
  def new
    @friend_request = current_user.friend_requests.new
  end
end
