$(document).ready(function(){

  // hide our element on page load

  $('#animatescroll').waypoint(function(direction) {
      $('#animatescroll').addClass('fadeInUp');
  }, { offset: '25%' });

});
