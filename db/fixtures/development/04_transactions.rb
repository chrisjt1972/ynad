User.where(email: ['john@ynad.com', 'mary@ynad.com']).each do |user|
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
    2.times do
      account.transactions.create!(
        date: Faker::Date.backward(90),
        amount: Random.rand(1000..5000) * 1000,
        payee: ['Paycheck', 'Freelancing', 'Investments'].sample,
        ynab_id: SecureRandom.uuid
      )
    end
  end
end
