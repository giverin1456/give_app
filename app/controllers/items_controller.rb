class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy, :favorite]
  before_action :order_set, only: [:edit, :update, :destroy]
  before_action :search_product

  
  def index
    @items = Item.all.order("created_at DESC")
    @tweets = Tweet.limit(10).order("created_at DESC")
    @results = @p.result.order("created_at DESC")
    set_item_column

    @results = @items.page(params[:page]).per(16)
  end

  def new
    if current_user.shop.present?
    @item = Item.new
    else
      redirect_to new_shop_path(current_user)
    end
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
    @user = @item.user
    @items = @user.items
    @shop = @user.shop
  end
  
  def update
    if @item.update(items_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    @items = Item.all
    @results = @p.result.page(params[:page]).per(16).order("created_at DESC")
    set_item_column

  end

  def favorite
    current_user.toggle_like!(@item)
    @item.create_notification_like!(current_user)
    redirect_to request.referer
  end


  private
  def items_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless Item.find(params[:id]).user.id == current_user.id
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def order_set
    if @item.user_id == current_user.id && @item.order == nil
      set_item
    else
      redirect_to root_path
    end
  end



  def search_product
    @p = Item.ransack(params[:q])
  end

  def set_item_column
    @item_name = Item.select("name").distinct
    @item_category = Category.all
    @item_status = Status.all
    @item_delivery_charge = DeliveryCharge.all
    @item_day = Day.all
  end
end