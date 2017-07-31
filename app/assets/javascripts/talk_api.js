$(document).on('turbolinks:load', function(){
  $(function(){
    function buildHtml(data){
      var html = '<li>'+
                    '<p>'+
                      data.results[0].reply +
                    '</p>'
                  '</li>'
      return html;
    }

    $('#talkapi__request').on('click', function(){
      var comment = $('#talkapi__input').val();

      $.ajax({
        type: "POST",
        url:"https://api.a3rt.recruit-tech.co.jp/talk/v1/smalltalk",
        data:{
          "apikey":"bzuXlmRoBDncSrVkVedCBe4vT0S4TJHt",
          "query":comment
        },
      })
      .done(function(data){
        var api_reply = data.results[0].reply;
        var html = buildHtml(data);
        $('#talkapi__reply').text(api_reply);
        $('#talkapi__input').val("");
        $('.talk_history').prepend(html);
      })
      .fail(function(){
        alert("メッセージを入れて下さい");
      })
    });
  });
});
