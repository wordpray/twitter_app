$(function(){

  var search_list = $(".search_lists");

  function appendTweet(tweet){
    var html = '<li class="search_list">'+
                  tweet.content +
               '</li>';
    search_list.append(html);
  }

  function appendNoTweet(tweet){
    var html = '<li>' +
                  tweet +
               '</li>'
    search_list.append(html);
  }

  $(".search-query").on("keyup", function(){
    var input = $(this).val();

    $.ajax({
      type: 'GET',
      url: '/tweets/search',
      data: {keyword: input},
      dataType: 'json'
    })

    .done(function(tweets){
      $(".search_lists").empty();
      if (tweets.length !== 0){
        tweets.forEach(function(tweet){
          appendTweet(tweet);
        });
      }else{
        appendNoTweet("一致するキーワードはありません")
      }
    })
    .fail(function(){
      alert('検索に失敗しました');
    })
  });

  $(document).on('click', '.search_list', function(){
    var search_result = $(this).html();
    
    $('.search-query').val(search_result);
    $('.search_list').empty();
    $('.search_lists').remove();
  })
});
