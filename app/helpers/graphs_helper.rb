module GraphsHelper
  def cashflow_graph
    data = {}

    @transactions&.each do |transaction|
      if data[transaction.date.strftime('%d, %B %Y')].present?
        data[transaction.date.strftime('%d, %B %Y')] += transaction.amount / 1000
      else
        data[transaction.date.strftime('%d, %B %Y')] = transaction.amount / 1000
      end
    end

    area_chart(
      data,
      label: 'Amount',
      xtitle: 'Last 90 days',
      colors: ['#1E8495'],
      prefix: '$',
      points: current_user.preference.graph_point_enabled
    )
  end

  def bank_balances
    data = {}

    @accounts&.each do |account|
      if data[account.name].present?
        data[account.name] += account.balance / 1000
      else
        data[account.name] = account.balance / 1000
      end
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
      if data[category_group.name].present?
        data[category_group.name] += category_group.categories.map(
          &:activity_amount
        ).sum / 1000
      else
        data[category_group.name] = category_group.categories.map(
          &:activity_amount
        ).sum / 1000
      end
    end

    pie_chart(
      data,
      prefix: '$'
    )
  end
end
