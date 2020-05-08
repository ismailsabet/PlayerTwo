class ConversationsController < ApplicationController

  def create
    @conversation = Conversation.new(conversation_params)
    @conversation.sender_id = current_user.id
    @conversation.messages.first.user_id = current_user.id

    if @conversation.save!
      # logger.debug "conversation has been saved"
    else
      # logger.debug "unable to save conversation!!"
    end
  end

  def update
    @conversation = Conversation.find(params[:id])

    respond_to do |format|
      format.js {
        if @conversation.update!(conversation_params)
          @messages = @conversation.messages
          render "matches/conversation_messages"
        else

        end
      }
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:recipient_id, messages_attributes: [:body, :user_id])
  end
end
