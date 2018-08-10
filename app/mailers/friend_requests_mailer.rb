class FriendRequestsMailer < ApplicationMailer
  def send_request(friend_request)
    @friend_request = friend_request

    mail to: @friend_request.email
  end
end
