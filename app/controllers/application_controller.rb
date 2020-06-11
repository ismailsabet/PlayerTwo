class ApplicationController < ActionController::Base
  before_action :configure_devise, if: :devise_controller?

  rescue_from(Steam::SteamError) do |e|
    flash[:error] = "Unknown vanity, please try again."
    redirect_to steam_index_path
  end


  private

  def configure_devise
    devise_parameter_sanitizer.permit(:account_update, keys: [ :firstname, :lastname, :dob, :username, images: [] ])
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :firstname, :lastname, :gender, :dob, :bio, :username, images: [] ])
  end
end
