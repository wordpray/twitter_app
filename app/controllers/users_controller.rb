class UsersController < ApplicationController
  before_action :set_user,            except: :index
  before_action :set_recommend_users, only:  [:show, :following, :followers, :likes]

  def index
    @title  = "Global"
    @users  = User.paginate(page: params[:page], per_page: 32)
  end

  def show
    @tweets = @user.tweets.paginate(page: params[:page], per_page: 30)
    @likes  = Like.where(tweet_id: params[:tweet_id])
  end

  def following
    @title  = "Following"
    @users  = @user.following
    render 'show_follow'
  end

  def followers
    @title  = "Followers"
    @users  = @user.followers
    render 'show_follow'
  end

  def likes
    @title  = "Likes"
    @likes  = @user.like_tweets.paginate(page: params[:page], per_page: 30)
    render 'show_likes'
  end

  private

  def set_user
    @user   = User.find(params[:id])
  end

  def set_recommend_users
    followings       = current_user.following
    following_ids    = followings.pluck(:id)
    ids              = following_ids.push(current_user.id)
    @recommend_users = User.all.where.not(id: ids).limit(5)
  end
end
