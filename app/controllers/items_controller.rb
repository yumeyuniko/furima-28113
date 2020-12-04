class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit ,:destroy]
  before_action  :set_item, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
    # flash[:notice] = "ログイン済ユーザーのみ出品できます" unless user_signed_in?
  end

  def new
    @item = Item.new
  end

  def create
    @item = ItemsTag.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy 
    @item.destroy if current_user.id == @item.user.id
    redirect_to root_path
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.valid?
      @item.save
      redirect_to item_path
    else
      render :edit
    end
  end


  def show
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['tag_name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end


  private
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :shipping_day_id, :price, :tag_name).merge(user_id: current_user.id)
  end


  def set_item
    @item = Item.find(params[:id])
  end
end