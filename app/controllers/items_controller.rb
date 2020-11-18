class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit ,:destroy]
  before_action only: :show

  def index
    @items = Item.includes(:user).order("created_at DESC")
    # flash[:notice] = "ログイン済ユーザーのみ出品できます" unless user_signed_in?
  end

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

  # def destroy
  #   item = Item.find(params[:id])
  #   item.destroy
  # end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.valid?
      @item.save
      redirect_to item_path
    else
      render :new
    end
  end


  def show
    @item = Item.find(params[:id])
  end



  private
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
