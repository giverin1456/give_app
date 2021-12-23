class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @items = @user.items
    @tweets = @user.tweets
    @shop = @user.shop
    
    @currentUserEntry = RoomUser.where(user_id: current_user.id)
    @roomUser = RoomUser.where(user_id: @user.id)
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
    # super
    # if account_update_params[:avatar].present?
    #   resource.avatar.attach(account_update_params[:avatar])    
    # end
  end

  # def destroy
  #   @user = User.find(params[:user_id])
  #   @favorite = Like.find(like_id: current_user_id, likeable_id: @item.id)
  # end

  def favorite
    @user = current_user
    @favorites = @user.likees(Item)
  end
  
  private
  def user_params
    params.require(:user).permit(:nickname, :first_name, :last_name, :first_kana, :last_kana, :email, :birthday, :shop_name, :shop_text, :image)
  end
end
