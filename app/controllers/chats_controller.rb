class ChatsController < ApplicationController
  def update
    @chat = Chat.find(params[:id])
    @chat.update(accepted: true)
    redirect_to dashboard_path
  end
end
