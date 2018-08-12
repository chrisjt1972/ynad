User.find_by(email: 'john@example.com').
  friends << User.find_by(email: 'mary@example.com')
