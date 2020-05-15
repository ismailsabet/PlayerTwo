class BrowseController < ApplicationController

  def browse
    @users = Match.recommended_matches_for(current_user.id)
  end

  def approve
    #swipe right
    user_id = params[:id]
    match = Match.between(user_id, current_user.id)

    if match.present?
      match = match.first

      if match.user_1 == current_user.id
        match.user_1_approves = true
      else
        match.user_2_approves = true
      end
    else
      match = Match.new(user_1: current_user.id, user_2: user_id, user_1_approves: true)
    end

    if match.save
      puts "saved"
    else
      puts "not saved"
    end

  end

  def decline
    #swipe left
    user_id = params[:id]
    match = Match.between(user_id, current_user.id)

    if match.present?
      match = match.first

      if match.user_1 == current_user.id
        match.user_1_approves = false
      else
        match.user_2_approves = false
      end
    else
      match = Match.new(user_1: current_user.id, user_2: user_id, user_1_approves: false)
    end

    if match.save
      puts "saved"
    else
      puts "not saved"
    end
  end

end
