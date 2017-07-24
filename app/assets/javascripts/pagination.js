jQuery(function() {
  if ($('#infinite-scrolling').size() > 0) {
    $(window).on('scroll', function() {
      var more_posts_url;
      more_posts_url = $('#infinite-scrolling .next_page a').attr('href');
      if (more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60) {
        $('.pagination').html(' ');
        $.getScript(more_posts_url, function() {});
      }
    });
  }
});
