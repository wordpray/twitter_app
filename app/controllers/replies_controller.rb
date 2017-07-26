class RepliesController < ApplicationController
  def new
    @tweet = Tweet.find(params[:tweet_id])

    @before_reply = Tweet.find(@tweet.reply_tweet) if @tweet.reply_tweet.present?
    @after_replies = Tweet.where(reply_tweet: @tweet.id)

    @reply = current_user.tweets.new(reply_nickname: @tweet.user.nickname, reply_tweet: @tweet.id)
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)

    if @tweet.save
      flash[:success] = "Reply success"
    else
      flash[:danger] = "Reply danger"
    end
    redirect_to root_url
  end

  private

  def tweet_params
    params.require(:tweet).permit(:reply_nickname, :reply_tweet, :content, :image)
  end
end
