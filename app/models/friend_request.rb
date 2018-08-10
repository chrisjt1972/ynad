class FriendRequest < ApplicationRecord
  belongs_to :user

  validates_presence_of :email, :first_name

  STATUSES = {
    pending: 'pending',
    accepted: 'accepted'
  }.freeze

  STATUSES.keys.each do |status|
    define_method("#{status}?") { self.status == status.to_s }
  end

  default_value_for :status, STATUSES[:pending]

  def generate_code
    self.code = SecureRandom.hex
  end

  def sent?
    persisted? && code.present?
  end

  def generate_sign_up_url
  end
end
