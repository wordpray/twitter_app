$(function(){
  $('#talkapi__request').on('click', function(){
    var comment = $('#talkapi__input').val();

    $.ajax({
      type: "POST",
      url:"https://api.a3rt.recruit-tech.co.jp/talk/v1/smalltalk",
      data:{
        "apikey":"bzuXlmRoBDncSrVkVedCBe4vT0S4TJHt",
        "query":comment
      },
      success:function(data){
        $('#talkapi__reply').text(data.results[0].reply);
      }
    });
  });
});
