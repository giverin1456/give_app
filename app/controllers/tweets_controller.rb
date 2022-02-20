class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show, :create, :edit, :update, :destroy, :search]
  before_action :set_tweet, only: [:show, :edit, :update, :destroy, :favorite]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
      redirect_to search_tweets_path
    else
      render :new
    end
  end

  def show
      @comment = TweetComment.new
      @comments = @tweet.tweet_comments.includes(:user)
  end

  def update
    if @tweet.update(tweet_params)
        redirect_to tweet_path
    else
        render :edit
    end
  end

  def destroy
    if tweet.destroy
      redirect_to search_tweets_path
    end
  end

  def search
    @q = Tweet.ransack(params[:q])
    @tweets = @q.result.includes(:user).order("created_at DESC")
  end
      
  def favorite
    current_user.toggle_like!(@tweet)
    redirect_to request.referer
    @tweet.create_notification_like!(current_user)
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text, :image).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    unless Tweet.find(params[:id]).user.id == current_user.id
      redirect_to root_path
    end
  end
end
