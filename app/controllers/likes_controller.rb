class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, tweet_id: params[:tweet_id])
    @likes = Like.where(tweet_id: params[:tweet_id])
  end

  def destroy
    @likes = Like.where(tweet_id: params[:tweet_id])
    like = Like.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    if like.destroy
    else
      redirect_to :back
    end
  end

end
