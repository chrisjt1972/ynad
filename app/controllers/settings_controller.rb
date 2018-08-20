class SettingsController < ApplicationController
  def index
    @preference = current_user.preference
  end

  def disconnect_ynab
    current_user.disconnect_ynab
    redirect_to settings_path
  end
end
