//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require moment
//= require bootstrap-datepicker
//= require bootstrap-datetimepicker
//= require_tree .

$(function () {
    $('.form_datetime').datetimepicker({ format: 'YYYY-MM-DD HH:mm' });
});

$('.input-daterange').datepicker({
});
