class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "some_channel_#{params[:room]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
