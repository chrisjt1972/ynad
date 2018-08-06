module GraphsHelper
  def cashflow_graph
    data = {}

    @transactions.each do |transaction|
      data[transaction.date.strftime('%d, %B %Y')] = transaction.amount / 1000
    end

    area_chart(
      data,
      label: 'Amount',
      xtitle: 'Last 90 days',
      points: false,
      colors: ['#1E8495'],
      prefix: '$'
    )
  end

  def bank_balances
    data = {}

    current_user.accounts.each do |account|
      data[account.name] = account.balance / 1000
    end

    bar_chart(
      data,
      label: 'Amount',
      colors: ['#1E8495'],
      prefix: '$'
    )
  end
end
