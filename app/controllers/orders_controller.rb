class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]

  def index
    @order = Order.new
    # ログインユーザが出品したユーザであり、または商品がない場合はトップへリダイレクトしてるよ
    if current_user.id == @item.user.id || @item.record.present?
      redirect_to root_path
    end
  end

  def new
  end

  def create
    @order = Order.new(order_params)

    if @order.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price, # 商品の値段
        card: order_params[:token], # カードトークン
        currency: 'jpy' # 通貨の種類（日本円）
      )
      @order.save
      redirect_to action: :index
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:postal_code,
                                  :prefecture_id,
                                  :city,
                                  :house_number,
                                  :building_name,
                                  :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
