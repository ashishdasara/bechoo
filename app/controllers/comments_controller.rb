class CommentsController < ApplicationController
  before_action :require_proper_route_for_role, only: [:index, :new, :unapproved_index]
  before_action :is_admin, only: [:approve, :unapproved_index]

  def index
    @advertisement = Advertisement.find(params[:advertisement_id])
    @comments = @advertisement.comments.newest_first.approved
  end

  def new
    @advertisement = Advertisement.find(params[:advertisement_id])
    @comment = Comment.new(params[user_id: current_user.id])
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
    if params[:admin_task] == "new_comments"
      redirect_to unapproved_index_comments_path(admin_task: params[:admin_task])
    else
      redirect_to comments_path(advertisement_id: @comment.advertisement_id)
    end
  end

  def unapproved_index
    @comments = Comment.unapproved
  end

  def approve
    @comment = Comment.find(params[:id])
    @comment.approved = true
    @comment.approved_by_id = current_user.id
    @comment.save
    redirect_to unapproved_index_comments_path
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :user_id, :advertisement_id)
  end
end
