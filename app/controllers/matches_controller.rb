class MatchesController < ApplicationController

  def matches
    @matches = Match.matches_for(current_user.id)
    @users = Match.recommended_matches_for( current_user.id )
    @conversations = Conversation.includes(:messages).where("conversations.sender_id = ? OR conversations.recipient_id = ?", current_user.id, current_user.id)
  end

  def open_conversation
    id = params[:id]
    @user = User.find(id)
    match = Match.between(current_user.id, id)
    @match = match.first if match.present?

    conversation = Conversation.between(id, current_user.id)

    @conversation = conversation.size > 0 ? conversation.first : Conversation.new
    @messages = @conversation.messages.includes(:user) if @conversation.persisted?
    @message = @conversation.messages.build

    if @user.present?
      respond_to do |format|
        format.js {
          render "matches/conversation"
        }
      end
    end
  end

end
