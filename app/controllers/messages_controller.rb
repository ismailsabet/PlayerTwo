class MessagesController < ApplicationController

  def create
  end

  def browse
    @matches = current_user.matches;
  end

end
