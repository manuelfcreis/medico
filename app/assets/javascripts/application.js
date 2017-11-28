//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require typing
//= require simple_form_autocomplete
//= require_tree .

$("#invite").on("keydown", function (e) {
    if (e.keyCode == 13) {
      e.preventDefault();
    }
});

