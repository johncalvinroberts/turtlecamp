//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require moment
//= require highcharts
//= require chartkick
//= require_tree .



$(document).ready(function() {
  $("#conf_msg").hide();
  $("#create_booking").on("click", function(event) {
  event.preventDefault();
  $("#conf_msg").show();
  $(".container-demo-form").hide();
})
});
