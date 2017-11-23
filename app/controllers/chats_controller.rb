class ChatsController < ApplicationController
  def update
    @chat = Chat.find(params[:id])
    @chat.update(accepted: true)
    redirect_to dashboard_path
  end

  def accept
    @chat = Chat.find(params[:id])
    @chat.update(accepted: true)
    redirect_to dashboard_path
  end

  def reject
    @chat = Chat.find(params[:id])
    @chat.destroy
    redirect_to dashboard_path
  end
end
