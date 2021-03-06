class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment, user_name: @comment.user.nickname
    end
  end

  def destroy
    @comment = Comment.includes(:user).find(params[:id])
    @comment.destroy if current_user.id == @comment.user.id

    redirect_to item_path(params[:item_id]), notice: '削除しました'
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
