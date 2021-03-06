class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item,           only: [:show, :edit, :update, :destroy]
  before_action :redirect_root,      only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :shipping_day_id, :price, :sold_status).merge(user_id: current_user.id)
  end

  def redirect_root
    if current_user.id != @item.user.id || @item.sold_status == 'sold'
      redirect_to root_path
    end
  end
end
