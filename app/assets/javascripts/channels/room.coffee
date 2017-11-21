room = $('meta[name=chatid]').attr("content");

App.room = App.cable.subscriptions.create { channel: "RoomChannel", room: room},

  received: (data) ->
    unless data.content.blank?
      $('#messages-table').append "<%= j render partial: 'messages/message', locals: { message: data } %>"
