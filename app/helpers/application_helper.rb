module ApplicationHelper
  def current_date
    Date.current.strftime('%d, %B %Y')
  end

  def ynab_api_limit_reached?
    current_user.ynab_api_limit_reached?
  end
end
