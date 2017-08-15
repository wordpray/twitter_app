module TweetsHelper
  def tweet_replies(tweet)
    Tweet.where(reply_tweet: tweet.id)
  end
end
