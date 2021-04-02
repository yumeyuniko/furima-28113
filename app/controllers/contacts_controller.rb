class ContactsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    # 入力画面を表示
    @contact = Contact.new

    render action: :index
  end

  def confirm
    # 入力値のチェック
    @contact = Contact.new(params[:contact].permit(:name, :email, :message))

    if @contact.valid?
      # OK。確認画面を表示
      render action: :confirm
    else
      # NG。入力画面を再表示
      render action: :index
    end
  end

  def thanks
    # メール送信
    @contact = Contact.new(params[:contact].permit(:name, :email, :message))
    ContactMailer.received_email(@contact).deliver

    # 完了画面を表示
    render action: :thanks
  end
end
