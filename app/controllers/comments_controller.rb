class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @item = @comment.item
    if @comment.save
      @item.create_notification_comment!(current_user, @comment.id, @item.id)
    redirect_to "/items/#{@comment.item.id}"
    else 
      "items/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
