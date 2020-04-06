class HomeController < ApplicationController

  def home
    redirect_to browse_path if user_signed_in?
  end
end
