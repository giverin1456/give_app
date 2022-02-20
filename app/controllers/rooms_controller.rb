class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: [:index, :show]


  def index
  end

  def create
    @room = Room.create(user_id: current_user.id)
    @entry1 = RoomUser.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = RoomUser.create(params.require(:room_user).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    if RoomUser.where(user_id: current_user.id,room_id: @room.id).present?
      @messages = @room.messages.order("created_at DESC")
      @message = Message.new
      @entries = @room.room_users
      .where.not(room_users: {user_id: current_user.id})
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def set_room
    @user = current_user
    @currentUserEntry = RoomUser.where(user_id: current_user.id)
    @roomUser = RoomUser.where(user_id: @user.id).select("room_id")
    @roomNickname = User.left_joins(:room_users)
    .where(room_users: {room_id: @roomUser})
    .where.not(room_users: {user_id: @user.id})
    .select("users.nickname, room_users.room_id")

    @fort = RoomUser.where(room_id: @roomUser)
    .where.not(room_users: {user_id: @user.id})
  end
end
