class TweetsController < ApplicationController
  def home
    if user_signed_in?
      @tweet = current_user.tweets.new if user_signed_in?
      @tweets = current_user.feed
    end
  end

  def about
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      flash[:success] = "ツイートが送信されました。"
      redirect_to root_url
    else
      @feed_items = []
      render action: "home"
    end
  end

  def destroy
    @tweet = current_user.tweets.find_by(id:params[:id])
    redirect_to root_url if @tweet.nil?

    @tweet.destroy
    flash[:success] = "Tweet deleted"
    redirect_to request.referrer || root_url
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content, :image)
  end
end
