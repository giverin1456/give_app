class TweetCommentsController < ApplicationController
  def create
    @comment = TweetComment.create(tweet_comment_params)
    redirect_to "/tweets/#{@comment.tweet.id}"
  end

  private
  def tweet_comment_params
    params.require(:tweet_comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end