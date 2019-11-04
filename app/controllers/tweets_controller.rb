class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    following_ids = current_user.following.pluck(:user_id)
    following_ids << current_user.id
    @tweets = Tweet.where(user_id: following_ids).order(created_at: :desc)
  end

  def new
    @tweet = current_user.tweets.new
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)

    if @tweet.save
      redirect_to tweets_path, notice: 'Tweet created'
    else
      flash[:error] = 'Error'
      render :new
    end
  end

  def destroy
    @tweet = current_user.tweets.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path, notice: 'Tweet deleted'
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
