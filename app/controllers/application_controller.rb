class ApplicationController < ActionController::Base
  before_action :configure_devise, if: :devise_controller?
  include Authentication
  include Nonce
  include Notification

  rescue_from(
    Rack::OAuth2::Client::Error,
    OpenIDConnect::Exception,
    Nonce::Exception,
    MultiJson::LoadError,
    OpenSSL::SSL::SSLError
  ) do |e|
    flash[:error] = if e.message.length > 2000
      'Unknown Error'
    else
      e.message
    end
    unauthenticate!
    redirect_to root_url
  end

  protect_from_forgery

  private

  def configure_devise
    devise_parameter_sanitizer.permit(:account_update, keys: [ :firstname, :lastname, :dob, :username, images: [] ])
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :firstname, :lastname, :gender, :dob, :bio, :username, images: [] ])
  end
end
