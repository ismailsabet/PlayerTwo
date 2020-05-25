class ApplicationController < ActionController::Base
  before_action :configure_devise, if: :devise_controller?

  private

  def configure_devise
    devise_parameter_sanitizer.permit(:account_update, keys: [ :firstname, :lastname, :dob, :username, images: [] ])
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :firstname, :lastname, :gender, :dob, :bio, :username, images: [] ])
  end
end
