class UsersController < ApplicationController
before_action :set_users, only: [:show, :following, :followers, :likes]

  def index
    @users = User.paginate(page: params[:page], per_page: 32)
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

  private

  def set_users
    @recommend_users = User.all.limit(5)
  end
end
