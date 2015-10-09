$(document).ready(function() {
  $('.button-collapse').sideNav();
  $('.close-mobie-sidebar').click(function() { $('.button-collapse').sideNav('hide'); }); 
  $('.alert-dismissible .close').click(function() { $(this).parent().fadeOut(); })
});
