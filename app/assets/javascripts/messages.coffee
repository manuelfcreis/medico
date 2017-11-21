message_appender = (content) ->
  $('#messages-table').append content

$(document).ready ->
  message_appender('hello, world!')

