$(document).ready(function() {
  $('.button-collapse').sideNav();
  $('.close-mobie-sidebar').click(function() { $('.button-collapse').sideNav('hide'); }); 
  $('.alert-dismissible .close').click(function() { $(this).parent().fadeOut(); })
  setTimeout(function() { $('.alert').fadeOut(); }, 3000);

  video_player = $('#video-player');
  video_link = '';
  $('.modal-trigger').click(function() { video_link = $(this); });
  $('.modal-trigger').leanModal({
    dismissible: true,
    opacity: .5,
    in_duration: 300,
    out_duration: 200,
    ready: function() {
      video_id  = video_link.data('video-id');
      embed_url = 'https://www.youtube.com/embed/' + video_id + '?rel=0&autoplay=1';
      external_url = 'https://www.youtube.com/watch?v=' + video_id;
      video_player.attr('src', embed_url);
      video_player.parent().parent().prev().children('.modal-yt-link').each(function() {
        $(this).attr('href', external_url);
      });
    },
    complete: function() { video_player.attr('src', ''); }
  });
});
