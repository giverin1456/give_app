class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @items = @user.items
    # @tweets = @user.tweets
    # @message = Message.new
    # @room = Room.find(params[:room_id])
    # @messages = @room.messages.includes(:user)
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

  def favorite
    @user = current_user
    @favorites = @user.likees(Item)
  end
  
  private
  def user_params
    params.require(:user).permit(:nickname, :first_name, :last_name, :first_kana, :last_kana, :email, :birthday, :shop_name, :shop_text, :image)
  end
end
