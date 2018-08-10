class FriendRequestsMailer < ApplicationMailer
  default from: 'notifications@ynad.com'

  def send_request(friend_request)
    @friend_request = friend_request

    mail(
      to: @friend_request.email,
      subject: 'You have been invited to join YNAD (You Need A Dashboard)'
    )
  end
end
