class MailSchedulerJob < ApplicationJob
  queue_as :mail_scheduler

  def perform(friend_request_id:)
    FriendRequests::NotificationsService.new(
      friend_request_id
    ).send_request
  end
end
