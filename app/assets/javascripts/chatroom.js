// let chatroom = $('#chatroom')
// let button = $('#send')
// let chatbody = $('.body')
var msgContent = $('#content')

var ready = function () {
  msgContent.keydown(function(event) {

    if (event.keyCode == 13 && event.shiftKey == 0) {
      // Prevent Submit on enter key
      event.preventDefault();

      // Create a message variable and empty the input
      message = msgContent.val();
      message = message.replace(/^\s+|\s+$/g, "");
      msgContent.val("");
      console.log(message);

      if (message != '') {
        message.submit
      }

    }
  });
}

$(document).on("page:load", ready);
