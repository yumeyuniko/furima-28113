class MypagesController < ApplicationController
  before_action :authenticate_user!

  def show
    @items = Item.includes(:user).order("created_at DESC")
    @records = Record.all
  end
end
