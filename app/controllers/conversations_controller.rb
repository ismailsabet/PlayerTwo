class ConversationController < ApplicationController

  def create
    @conversation = Conversation.new(conversation_params)
    @conversation.sender_id = current_user.id
    @conversation.messages.first.user_id = current_user.id
  end

  private

  def conversation_params
    params.require(:conversation).permit(:recipient_id, messages_attributes: [:body, :user_id])
  end

end
