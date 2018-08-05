module ApplicationHelper
  def current_date
    Date.current.strftime('%d, %B %Y')
  end
end
