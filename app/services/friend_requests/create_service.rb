module FriendRequests
  class CreateService < BaseService
    attr_reader :current_user, :params

    def execute
      friend_request = current_user.friend_requests.build(params)

      friend_request.tap do |friend_request|
        friend_request.generate_code
        friend_request.save!
      end

    rescue ActiveRecord::RecordInvalid => e
      fail(error: e.message)
    rescue StandardError => e
      fail(error: e.message)
    end
  end
end
