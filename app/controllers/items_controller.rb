class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_user, only: [:new, :create, :edit, :update]

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
    
    if @item.update(item_params) && @item.previous_changes.present?
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_user
    redirect_to root_path unless current_user == User.find_by(id: @item.user_id)
  end

end

