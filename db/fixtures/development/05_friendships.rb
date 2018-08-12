john = User.find_by(email: 'john@example.com')
mary = User.find_by(email: 'mary@example.com')

john.friend_requests.create!(
  first_name: mary.first_name,
  email: mary.email,
  status: FriendRequest::STATUSES[:accepted]
)


john.friends << mary
