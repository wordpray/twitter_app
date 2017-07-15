class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
    @likes = Like.where(tweet_id: params[:tweet_id])
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

  def likes
    @title = "Likes"
    @user = User.find(params[:id])
    @likes = @user.like_tweets
    render 'show_likes'
  end
end
