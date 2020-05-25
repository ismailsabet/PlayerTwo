class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @conversation = Conversation.new(conversation_params)
    @conversation.sender_id = current_user.id
    @conversation.messages.first.user_id = current_user.id

    respond_to do |format|
      format.js {
        if @conversation.save!
          @messages = @conversation.messages
          render "matches/conversation_messages"
        else
          # logger.debug "unable to save conversation!!"
        end
      }
    end
  end

  def update
    @conversation = Conversation.find(params[:id])
    @conversation.sender_id = current_user.id

    respond_to do |format|
      format.js {
        if @conversation.update!(conversation_params)
          @messages = @conversation.messages
          render "matches/conversation_messages"
        else
          # logger.debug "unable to update conversation!!"
        end
      }
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:recipient_id, messages_attributes: [:body, :user_id])
  end
end
