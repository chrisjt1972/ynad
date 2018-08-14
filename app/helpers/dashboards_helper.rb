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
end
