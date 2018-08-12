User.where(email: ['john@example.com', 'mary@example.com']).each do |user|
  user.budgets.each do |budget|
    ['Immediate Obligations', 'Fun Money', 'Food'].each do |category_group|
      budget.category_groups.create!(
        name: category_group,
        ynab_id: SecureRandom.uuid
      )
    end
  end
end

