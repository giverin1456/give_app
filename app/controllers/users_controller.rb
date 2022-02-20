class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :follow, :followees, :follower]
  before_action :move_to_index, only: [:edit, :update]
  
  def show
    @items = @user.items
    @tweets = @user.tweets.order("created_at DESC")
    @shop = @user.shop

    @currentUserEntry = RoomUser.where(user_id: current_user.id)
    @roomUser = RoomUser.where(user_id: @user.id).select("room_id")

    @star = RoomUser.where(room_id: current_user.id)

    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @roomUser.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end

      if @isRoom
      else
        @room = Room.new
        @entry = RoomUser.new
      end
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def favorite
    @user = current_user
    @favorites = @user.likees(Item)
  end

  def tweetfavorite
    @user = current_user
    @favorites = @user.likees(Tweet)
  end

  def follow
    current_user.toggle_follow!(@user)
    redirect_to user_url @user

    @user.create_notification_follow!(current_user)
  end

  def followees
    @favorites = @user.followees(User)
  end

  def follower
    @favorites = @user.followers(User)
  end

  def buy
    @item = Order.where(user_id: current_user.id).select("item_id")
  end

  def sale
    @item = Item.joins(:order).where(items: {user_id: current_user.id})
  end
  
  private
  def user_params
    params.require(:user).permit(:nickname, :first_name, :last_name, :first_kana, :last_kana, :email, :birthday, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def move_to_index
    unless User.find(params[:id]).id == current_user.id
      redirect_to root_path
    end
  end

end
