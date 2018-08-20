class SettingsController < ApplicationController
  def index
    @preference = current_user.preference
  end

  def disconnect_ynab
    current_user.disconnect_ynab

    redirect_to settings_path
  end

  def destroy_user
    current_user.destroy!

    redirect_to root_path
  end
end
