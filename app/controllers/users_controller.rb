class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @age = ((Time.zone.now - @user.dob.to_time) / 1.year.seconds).floor
  end

end
