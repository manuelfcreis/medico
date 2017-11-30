class ChatsController < ApplicationController
  def update
    @chat = Chat.find(params[:id])
    @chat.update(accepted: true)
    redirect_to request.referer
  end

  def accept
    @chat = Chat.find(params[:id])
    @chat.update(accepted: true)
    redirect_to request.referer
  end

  def reject
    @chat = Chat.find(params[:id])
    @chat.destroy
    redirect_to request.referer
  end
end
