class PreferencesController < ApplicationController
  def update
    @preference = current_user.preference.update(update_params)
    redirect_to settings_path if @preference
  end

  private

  def update_params
    params.require(:preference).permit(:graph_point_enabled)
  end
end
