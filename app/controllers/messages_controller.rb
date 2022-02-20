class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    if RoomUser.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      
      @message = Message.new(params.require(:message).permit(:user_id, :text, :room_id).merge(user_id: current_user.id))
      @room = @message.room
      if @message.save
      @room.create_notification_comment!(current_user, @message.id)
      end
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
    end
      redirect_to "/rooms/#{@message.room_id}"
  end
end
