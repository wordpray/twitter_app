$(document).on('turbolinks:load', function(){
  $(function(){
  $('.tweet_form textarea').on('keyup keydown', function(){
    var thisValueLength = $(this).val().length;
    var LeftoverValueLength = 140 - thisValueLength;

    if (LeftoverValueLength > 10){
      $('.count').css('color', '');
      $('.count').html(LeftoverValueLength);
    }else{
      $('.count').html(LeftoverValueLength).css('color', 'red');
    }
  });

  $('.reply_form textarea').on('keyup keydown', function(){
    var thisValueLength = $(this).val().length;
    var LeftoverValueLength = 140 - thisValueLength;
    
    if (LeftoverValueLength > 10){
      $('.count').css('color', '');
      $('.count').html(LeftoverValueLength);
    }else{
      $('.count').html(LeftoverValueLength).css('color', 'red');
    }
  });
});
});


