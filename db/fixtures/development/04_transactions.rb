User.where(email: ['john@example.com', 'mary@example.com']).each do |user|
  user.accounts.each do |account|
    # Expenses
    50.times do
      account.transactions.create!(
        date: Faker::Date.backward(90),
        amount: (-1000*Random.rand(100..500))
      )
    end

    # Income
    10.times do
      account.transactions.create!(
        date: Faker::Date.backward(90),
        amount: Random.rand(1000..5000) * 1000
      )
    end
  end
end
