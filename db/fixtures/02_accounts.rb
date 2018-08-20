User.where(email: ['john@ynad.com', 'mary@ynad.com']).each do |user|
  user.budgets.each do |budget|
    5.times do
      budget.accounts.create!(
        name: Faker::Bank.name,
        ynab_id: SecureRandom.uuid,
        kind: 'checking',
        balance: Random.rand(100..30000) * 1000
      )
    end
  end
end

