module GraphsHelper
  def cashflow_graph
    data = {}

    @transactions&.each do |transaction|
      data[transaction.date.strftime('%d, %B %Y')] = transaction.amount / 1000
    end

    area_chart(
      data,
      label: 'Amount',
      xtitle: 'Last 90 days',
      colors: ['#1E8495'],
      prefix: '$'
    )
  end

  def bank_balances
    data = {}

    @accounts&.each do |account|
      data[account.name] = account.balance / 1000
    end

    bar_chart(
      data,
      label: 'Amount',
      colors: ['#1E8495'],
      prefix: '$'
    )
  end

  def category_groups_pie
    data = {}

    @category_groups&.each do |category_group|
      data[category_group.name] = category_group.categories.map(
        &:activity_amount
      ).sum / 1000
    end

    pie_chart(
      data,
      prefix: '$'
    )
  end
end
