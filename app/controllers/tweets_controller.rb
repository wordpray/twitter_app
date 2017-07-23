class TweetsController < ApplicationController
before_action :set_users, only: [:home, :create, :search]

  def home
    if user_signed_in?
      @user = current_user
      @tweet = current_user.tweets.new if user_signed_in?
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 30)
      @likes = Like.where(tweet_id: params[:tweet_id])
    end
  end

  def about
  end

  def search
    @tweets_keywords = Tweet.where('content LIKE(?)', "%#{params[:keyword]}%").paginate(page: params[:page], per_page: 30)
    @likes = Like.where(tweet_id: params[:tweet_id])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      flash[:success] = "ツイートが送信されました。"
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 30)
      @likes = Like.where(tweet_id: params[:tweet_id])
      respond_to do |format|
      format.html { redirect_to root_url }
      format.js
      end
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

  def set_users
    followings = current_user.following
    following_ids = followings.pluck(:id)
    ids = following_ids.push(current_user.id)
    @recommend_users =  User.all.where.not(id: ids).limit(5)
  end
end
