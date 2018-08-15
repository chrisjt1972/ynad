module DashboardsHelper
  def ynab_oauth_url
    current_user.ynab_oauth_url
  end

  def current_user_nav_active?
    (params[:user] == current_user.id) ||
      params[:user].blank?
  end

  def friends_nav_active?
    !@user.kind_of?(Array) && params[:user].present?
  end

  def all_nav_active?
    (params[:user]&.downcase == 'all') ||
      @user.kind_of?(Array)
  end

  def tooltip_from_title(title)
    case title
    when 'Net Worth'
      t('tooltips.net_worth_card')
    when 'Income'
      t(
        'tooltips.income_card',
        current_month: current_month,
        current_year: current_year
      )
    when 'Expense'
      t(
        'tooltips.expense_card',
        current_month: current_month,
        current_year: current_year
      )
    end
  end

  def card_border_top_class(title)
    case title
    when 'Net Worth'
      "border-top-info"
    when 'Income'
      "border-top-success"
    when 'Expense'
      "border-top-danger"
    end
  end

  def ynab_api_limit_reached_tooltip
    t('tooltips.ynab_api_limit_reached')
  end

  def current_month
    Date::MONTHNAMES[Date.today.month]
  end

  def current_year
    Date.today.year
  end
end
