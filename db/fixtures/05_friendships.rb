john = User.find_by(email: 'john@ynad.com')
mary = User.find_by(email: 'mary@ynad.com')

john.friend_requests.create!(
  first_name: mary.first_name,
  email: mary.email,
  status: FriendRequest::STATUSES[:accepted]
)


john.friends << mary
