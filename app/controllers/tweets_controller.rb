class TweetsController < ApplicationController
  before_action :set_likes,           only: [:home, :search, :create]
  before_action :set_recommend_users, only: [:home, :search, :create]

  def home
    @user       = current_user
    @tweet      = current_user.tweets.new
    @feed_items = current_user.feed.paginate(page: params[:page], per_page: 30)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def about
  end

  def search
    @tweets_keywords  = Tweet.where('content LIKE(?)', "%#{params[:keyword]}%").paginate(page: params[:page], per_page: 20)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @tweet            = current_user.tweets.new(tweet_params)

    if @tweet.save
      @feed_items     = current_user.feed.paginate(page: params[:page], per_page: 30)
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js
      end
    else
      flash[:danger]  = "ツイートに失敗しました。"
      @feed_items     = []
      render action: "home"
    end
  end

  def destroy
    @tweet            = current_user.tweets.find_by(id:params[:id])
    redirect_to root_url if @tweet.nil?

    @tweet.destroy
    flash[:success]   = "Tweet deleted"
    redirect_to request.referrer || root_url
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content, :image)
  end

  def set_likes
    @likes           = Like.where(tweet_id: params[:tweet_id])
  end

  def set_recommend_users
    followings       = current_user.following
    following_ids    = followings.pluck(:id)
    ids              = following_ids.push(current_user.id)
    @recommend_users =  User.all.where.not(id: ids).limit(5)
  end
end
