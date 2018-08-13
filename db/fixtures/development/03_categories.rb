User.where(email: ['john@example.com', 'mary@example.com']).each do |user|
  user.budgets.each do |budget|
    5.times do
      budget.category_groups.create!(
        name: Faker::Commerce.department,
        ynab_id: SecureRandom.uuid
      )
    end
  end
end

User.where(email: ['john@example.com', 'mary@example.com']).each do |user|
  user.budgets.each do |budget|
    budget.category_groups.each do |category_group|
      category_group.categories.create!(
        name: Faker::Commerce.department,
        ynab_id: SecureRandom.uuid,
        budgeted_amount: Random.rand(10000..500000),
        activity_amount: (-1*Random.rand(10000..500000))
      )
    end
  end
end

