class ShopsController < ApplicationController
  def index
    @shops = Shop.all.order("created_at DESC")
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to user_path(@shop.user)
    else
      render new
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to user_path(@shop.user)
    else
      render :edit
    end
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :text, :shop_category_id).merge(user_id: current_user.id)
  end
end
