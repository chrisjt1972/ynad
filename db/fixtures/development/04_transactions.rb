User.where(email: ['john@example.com', 'mary@example.com']).each do |user|
  user.accounts.each do |account|
    # Expenses
    10.times do
      account.transactions.create!(
        date: Faker::Date.backward(90),
        amount: (-1000*Random.rand(100..500)),
        payee: Faker::Commerce.department,
        ynab_id: SecureRandom.uuid
      )
    end

    # Income
    5.times do
      account.transactions.create!(
        date: Faker::Date.backward(90),
        amount: Random.rand(1000..5000) * 1000,
        payee: Faker::Commerce.department,
        ynab_id: SecureRandom.uuid
      )
    end
  end
end
