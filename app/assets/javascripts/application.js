// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function(){
  var wideLayout = function() {
    $('.lightwell').addClass("full-width", function() { $(this).removeClass("col-sm-3"); });
    $('.fa-align-justify').addClass("selected");
    $('.fa-th').removeClass("selected");
  };
  var gridLayOut = function() {
    $('.lightwell').addClass("col-sm-3", function() {$(this).removeClass("full-width"); });
    $('.fa-align-justify').removeClass("selected");
    $('.fa-th').addClass("selected");
  };

  $('#send_email_modal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var recipient = button.data('whatever');
    var answer = button.data('answer-id');

    var modal = $(this)
    modal.find('.modal-title').text('New message to ' + recipient);
    modal.find('.modal-body input#recipient').val(recipient);
    modal.find('.modal-body input#answer_id').val(answer);
  });
});
