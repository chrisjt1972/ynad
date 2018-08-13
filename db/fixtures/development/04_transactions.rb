User.where(email: ['john@example.com', 'mary@example.com']).each do |user|
  user.accounts.each do |account|
    100.times do
      account.transactions.create!(
        date: Faker::Date.backward(90),
        amount: [
          Random.rand(10000..50000000),
          (-1*Random.rand(10000..50000000))
        ].sample
      )
    end
  end
end
