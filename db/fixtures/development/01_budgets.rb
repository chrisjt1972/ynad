User.where(email: ['john@example.com', 'mary@example.com']).each do |user|
  Budget.seed do |s|
    s.user_id = user.id
    s.name = "#{user.first_name}'s Budget"
    s.ynab_id = SecureRandom.uuid
  end
end
