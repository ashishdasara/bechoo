class CommentsController < ApplicationController
  def index
    @advertisement = Advertisement.find(params[:advertisement_id])
    @comments = @advertisement.comments.newest_first
  end

  def new
    @advertisement = Advertisement.find(params[:advertisement_id])
    @comment = Comment.new(params[:user_id => current_user.id])
  end

  def create
    @comment = Comment.new(comment_params)
    @advertisement_id = @comment.advertisement_id
    if @comment.save
      flash[:notice] = "Successfully submitted.. Will be posted after review"
      redirect_to advertisement_path(@advertisement_id)
    else
      render('new')
    end
  end
  def edit

  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_path(:advertisement_id => @comment.advertisement_id)
  end
  private
  def comment_params
    params.require(:comment).permit(:text, :user_id, :advertisement_id)
  end
end
