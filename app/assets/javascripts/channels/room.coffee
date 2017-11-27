room = $('meta[name=chatid]').attr("content");

self = (x, y) ->
  if x == y
    "self"
  else
    "other"

scroll_bottom = () ->
  if $('#messages-table').length > 0
    $('#messages-table').scrollTop($('#messages-table')[0].scrollHeight)

submit_listen = () ->
  $('#new_message').on 'keydown', (event) ->
    if event.keyCode is 13
      $('#chat-input').click()
      event.target.value = ""
      event.preventDefault()

App.room = App.cable.subscriptions.create { channel: "RoomChannel", room: room},

  received: (data) ->
    unless data.content.blank?
      x = data.sender
      y = $('meta[name=receiver_class]').attr('content')
      $('#messages-table').append "<div class='message-line'>" + "<div class='message " + self(x, y) + " " + data.sender + " '>" + "<p> " + data.content + "</p>" + "</div>" + "</div>"
      scroll_bottom()

$(document).ready ->
  scroll_bottom()
  submit_listen()
