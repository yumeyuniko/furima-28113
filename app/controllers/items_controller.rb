class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  # def index
  #   @items = Item.all
  #   flash[:notice] = "ログイン済ユーザーのみ出品できます" unless user_signed_in?
  # end

  def new
    @item = Item.new
    
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  # def edit
  # end

  # def update
  #   @item.update(item_params)
  #   redirect_to root_path
  # end



  private
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
