class ItemsController < ApplicationController

  before_action :authenticate_user!, except:[:index]
  before_action :set_user, only: [:new, :create]

  def index

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



  private
  def item_params
    params.require(:item).permit(:name, :image, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  
  end

  def set_user
    @user = current_user
  end

end

