class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item,           only: [:show, :edit, :update, :redirect_root]
  before_action :redirect_root,      only: [:edit, :update]

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

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def redirect_root
    set_item
    if current_user.id != @item.user.id
      redirect_to root_path
    end
  end
end
