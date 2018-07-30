module DashboardsHelper
  def ynab_oauth_url
    current_user.ynab_oauth_url
  end
end
