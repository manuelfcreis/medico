class MessagesController < ApplicationController
  include ApplicationHelper
  def index
  end

  def create
    @messages = current_active.messages
    @receiver = receiver_finder(params[:chat_id], params[:sender])
    @chat = Chat.find(params[:chat_id])

    @message = current_active.messages.build(message_params)
    @message.chat = @chat
    @message.sender = params[:sender]

    if @message.save
      redirect_to @receiver
    else
      redirect_to @receiver
    end
  end

  private

    def get_messages
      @messages = Message.for_display
      @message  = current_active.messages.build
    end

    def message_params
      params.require(:message).permit(:content)
    end
end
