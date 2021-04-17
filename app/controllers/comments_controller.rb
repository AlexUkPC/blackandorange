class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  def create
    @bando = Bando.find(params[:bando_id]) #finds the bando with the associated bando_id
    @comment = @bando.comments.create(comment_params) #creates the comment on the bando passing in params
    @comment.user_id = current_user.id if current_user # assigns logged in user's ID to comment
    @comment.save!

    redirect_to bando_path(@bando)
  end

  def destroy
    @bando = Bando.find(params[:bando_id])
    @comment = @bando.comments.find(params[:id])
    @comment.destroy
    redirect_to bando_path(@bando)
  end
  private
  def comment_params
    params.require(:comment).permit(:name, :response)
  end
end