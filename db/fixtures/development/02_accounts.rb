User.where(email: ['john@example.com', 'mary@example.com']).each do |user|
  user.budgets.each do |budget|
    5.times do
      budget.accounts.create!(
        name: Faker::Bank.name,
        ynab_id: SecureRandom.uuid,
        kind: 'checking',
        balance: Random.rand(10000..10000000)
      )
    end
  end
end

