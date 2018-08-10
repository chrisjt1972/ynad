class FriendRequest < ApplicationRecord
  belongs_to :user

  validates_presence_of :email

  STATUSES = {
    pending: 'pending',
    accepted: 'accepted'
  }.freeze

  default_value_for :status, STATUSES[:pending]

  def generate_code
    self.code = SecureRandom.hex
  end

  def sent?
    persisted? && code.present?
  end
end
