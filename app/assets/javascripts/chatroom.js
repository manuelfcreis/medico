// let chatroom = $('#chatroom')
// let button = $('#send')
// let chatbody = $('.body')
var msgContent = $('#content')

var ready = function () {
  msgContent.keydown(function(event) {

    if (event.keyCode == 13 && event.shiftKey == 0) {
      event.preventDefault();
      console.log('Hey, I\'m a enter key');
    }
  });
}

$(document).ready(ready);
$(document).on("page:load", ready);
