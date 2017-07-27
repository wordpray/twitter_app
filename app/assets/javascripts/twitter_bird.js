$(document).on('turbolinks:load', function(){
  $(function(){
    var gateAwayCommand = "gate away";
    var comeBackCommand = "come back";
    var leftCommand = "left";
    var rightCommand = "right";
    var fallCommand = "fall";
    var restCommand = "rest";
    var bigCommand = "big";
    var smallCommand = "small";
    var returnCommand = "return";
    var facebookCommand = "facebook";
    var instagramCommand = "instagram";
    var mercariCommand = "mercari";
    var twitterCommand = "twitter";

    $('.tweet_form textarea').on("keyup keydown", function(){
      var inputKey = $(this).val();

      if (inputKey == gateAwayCommand){
        $(".twitter-logo").fadeOut("slow");
        inputKey = ""
      }
      if (inputKey == comeBackCommand){
        $(".twitter-logo").fadeIn("normal");
        inputKey = ""
      }
      if (inputKey == leftCommand){
        $(".twitter-logo").animate({'marginRight': '500px'});
        inputKey = ""
      }
      if (inputKey == rightCommand){
        $(".twitter-logo").animate({'marginLeft': '500px'});
        inputKey = ""
      }
      if (inputKey == fallCommand){
        $(".twitter-logo").toggleClass('magictime magic');
        inputKey = ""
      }
      if (inputKey == restCommand){
        $(".twitter-logo").toggleClass('magictime openDownLeft');
        inputKey = ""
      }
      if (inputKey == bigCommand){
        $(".twitter-logo").css({'width':'60px',
                                'height':'60px'});
        inputKey = ""
      }
      if (inputKey == smallCommand){
        $(".twitter-logo").css({'width':'10px',
                                'height':'10px'});
        inputKey = ""
      }
      if (inputKey == returnCommand){
        $(".twitter-logo").css({'width':'30px',
                                'height':'30px'});
        inputKey = ""
      }
      if (inputKey == facebookCommand){
        $(".twitter-logo").attr("src", "facebook.png");
        inputKey = ""
      }
      if (inputKey == instagramCommand){
        $(".twitter-logo").attr("src", "assets/instagram.png");
        inputKey = ""
      }
      if (inputKey == mercariCommand){
        $(".twitter-logo").attr("src", "assets/mercari.png");
        inputKey = ""
      }
      if (inputKey == twitterCommand){
        console.log(inputKey);
        $(".twitter-logo").attr("src", "assets/twitter.png");
        inputKey = ""
      }
    });
    });
});
