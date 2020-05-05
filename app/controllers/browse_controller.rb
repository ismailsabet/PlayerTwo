class BrowseController < ApplicationController

  def browse
    liked_user_ids = Like.where(user_id: current_user.id).map(&:liked_user_id)
    liked_user_ids << current_user.id
    @users = User.where.not(id: liked_user_ids)
  end

  def approve
    #swipe right
    user_id = params[:id]

    new_like = Like.new(liked_user_id: user_id)
    new_like.user_id = current_user.id

    if new_like.save
      # check if user likes us back
      existing_like = Like.where(user_id: user_id, liked_user_id: current_user.id).count
      @they_like_us = existing_like > 0
    else
      # return warning message
    end

  end

  def decline
    #swipe left
  end

end
