User.where(email: ['john@example.com', 'mary@example.com']).each do |user|
  2.times do |index|
    Budget.seed do |s|
      s.user_id = user.id
      s.name = "#{user.first_name}'s Budget (#{index})"
      s.ynab_id = SecureRandom.uuid
    end
  end
end
