class LikesController < ApplicationController
  before_action :set_likes, only: [:create, :destroy]

  def create
    @like    = Like.create(user_id: current_user.id, tweet_id: params[:tweet_id])
    @tweet   = Tweet.find(params[:tweet_id])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @like    = Like.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    if @like.destroy
      @tweet = Tweet.find(params[:tweet_id])
      respond_to do |format|
        format.js
      end
    else
      redirect_to :back
    end
  end

  private

  def set_likes
    @likes   = Like.where(tweet_id: params[:tweet_id])
  end
end
