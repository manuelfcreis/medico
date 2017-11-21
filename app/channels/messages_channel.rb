class MessagesChannel < ApplicationCable::Channel

  def subscribed
    stream_from "messages_#{params[:id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak
  end
end
