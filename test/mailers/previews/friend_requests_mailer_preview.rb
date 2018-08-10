# Preview all emails at http://localhost:3000/rails/mailers/friend_requests_mailer
class FriendRequestsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/friend_requests_mailer/send_request
  def send_request
    FriendRequestsMailer.send_request
  end

end
