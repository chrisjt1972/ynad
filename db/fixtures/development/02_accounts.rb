User.where(email: ['john@example.com', 'mary@example.com']).each do |user|
  user.budgets.each do |budget|
    ['Chase', 'Bank of America'].each do |bank|
      budget.accounts.create!(
        name: bank,
        ynab_id: SecureRandom.uuid,
        kind: 'checking',
        balance: [1500035, 2432081].sample
      )
    end
  end
end

