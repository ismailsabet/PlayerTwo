class MatchesController < ApplicationController

  def matches
    @matches = current_user.matches
  end

  def open_conversation
    id = params[:id]
    @user = User.find(id)
    likes = Like.where(user_id: current_user.id, liked_user_id: id)
    @match = likes.first if likes.size > 0

    puts @match.id
  end

end
