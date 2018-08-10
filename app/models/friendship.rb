class Friendship < ApplicationRecord
  after_create :create_inverse_friendship

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  private

  def create_inverse_friendship
    friend.friends << user
  end
end
