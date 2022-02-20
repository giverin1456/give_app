class TweetCommentsController < ApplicationController
  def create
    @comment = TweetComment.new(tweet_comment_params)
    @tweet = @comment.tweet
    if @comment.save
     @tweet.create_notification_comment!(current_user, @comment.id)
     redirect_to "/tweets/#{@comment.tweet.id}"
    else
      render 'tweet/show'
    end
  end

  private
  def tweet_comment_params
    params.require(:tweet_comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end