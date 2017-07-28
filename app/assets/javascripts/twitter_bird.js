$(document).on('turbolinks:load', function(){
  $(function(){
    var command = {gateAway:   "gate away",
                   comeBack:   "come back",
                   left:       "left",
                   right:      "right",
                   fall:       "fall",
                   rest:       "rest",
                   big:        "big",
                   small:      "small",
                   return:     "return",
                   facebook:   "facebook",
                   instagram:  "instagram",
                   mercari:    "marcari",
                   twitter:    "twitter"}

    $('.tweet_form textarea').on("keyup keydown", function(){
      var inputKey     = $(this).val();
      var twitter_logo = ".twitter-logo"

      if (inputKey == command.gateAway){
        $(twitter_logo).fadeOut("slow");
        inputKey = "";
      }
      if (inputKey == command.comeBack){
        $(twitter_logo).fadeIn("normal");
        inputKey = ""
      }
      if (inputKey == command.left){
        $(twitter_logo).animate({'marginRight': '500px'});
        inputKey = ""
      }
      if (inputKey == command.right){
        $(twitter_logo).animate({'marginLeft': '500px'});
        inputKey = ""
      }
      if (inputKey == command.fall){
        $(twitter_logo).toggleClass('magictime magic');
        inputKey = ""
      }
      if (inputKey == command.rest){
        $(twitter_logo).toggleClass('magictime openDownLeft');
        inputKey = ""
      }
      if (inputKey == command.big){
        $(twitter_logo).css({'width':'60px',
                             'height':'60px'});
        inputKey = ""
      }
      if (inputKey == command.small){
        $(twitter_logo).css({'width':'10px',
                             'height':'10px'});
        inputKey = ""
      }
      if (inputKey == command.return){
        $(twitter_logo).css({'width':'30px',
                             'height':'30px'});
        inputKey = ""
      }
      if (inputKey == command.facebook){
        $(twitter_logo).attr("src", "facebook.png");
        inputKey = ""
      }
      if (inputKey == command.instagram){
        $(twitter_logo).attr("src", "instagram.png");
        inputKey = ""
      }
      if (inputKey == command.mercari){
        $(twitter_logo).attr("src", "mercari.png");
        inputKey = ""
      }
      if (inputKey == command.twitter){
        $(twitter_logo).attr("src", "twitter.png");
        inputKey = ""
      }
    });
    });
});
