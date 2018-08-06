module GraphsHelper
  def cashflow_graph
    data = {}

    @transactions.select(&:expense?).each do |transaction|
      data[transaction.date.strftime('%d, %B %Y')] = transaction.amount.abs / 1000
    end

    area_chart(data)
  end

  def bank_balances
    data = {}

    current_user.accounts.each do |account|
      data[account.name] = account.balance / 1000
    end

    bar_chart data
  end
end
