module FriendRequests
  class NotificationsService
    def initialize(friend_request_id)
      return unless friend_request_id

      @friend_request = ::FriendRequest.find(friend_request_id)
    end

    def send_request
      FriendRequestsMailer.send_request(
        @friend_request
      ).deliver
    end
  end
end
