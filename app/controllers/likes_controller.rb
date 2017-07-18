class LikesController < ApplicationController
  def create
    @tweet = Tweet.find(params[:tweet_id])
    @like = Like.create(user_id: current_user.id, tweet_id: params[:tweet_id])
    @likes = Like.where(tweet_id: params[:tweet_id])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @likes = Like.where(tweet_id: params[:tweet_id])
    @like = Like.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    if @like.destroy
      respond_to do |format|
        format.js
      end
    else
      redirect_to :back
    end
  end

end
