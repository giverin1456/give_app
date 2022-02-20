class ShopsController < ApplicationController
  before_action :set_shop, only: [:edit, :update]
  before_action :move_to_index, only: [:edit, :update]
  
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
      render "shops/new"
    end
  end

  def update
    if @shop.update(shop_params)
      redirect_to user_path(@shop.user)
    else
      render :edit
    end
  end

  def search
    @q = Shop.ransack(params[:q])
    @shops = @q.result.order("created_at DESC")
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :text, :shop_category_id, :prefecture_id, :image).merge(user_id: current_user.id)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def move_to_index
    unless Shop.find(params[:id]).user.id == current_user.id
      redirect_to root_path
    end
  end
end
