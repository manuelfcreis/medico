App.messages = App.cable.subscriptions.create('MessagesChannel', {

  received: function(data) {
    $("#messages").removeClass('hidden')
    return $('#messages').append(this.renderMessage(data));
  },


  appendLine: function(data) {
    html = @createLine(data)
    $("[data-chat-room='Best Room']").append(html)
  }

  renderMessage: function(data) {
    return "<p><b>" + data.user + ": </b>" + data.message + "</p>";
  }
});
