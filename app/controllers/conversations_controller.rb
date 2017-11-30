class ConversationsController < ApplicationController
  before_action :require_proper_route_for_role, only: :index


  def create

    if user_signed_in?
      if Conversation.where(advertisement_id: params[:advertisement_id]).between(params[:sender_id], params[:recipient_id], params[:advertisement_id]).present?
        puts "conv exists"
        @conversation = Conversation.where(advertisement_id: params[:advertisement_id]).between(params[:sender_id], params[:recipient_id], params[:advertisement_id]).first
      else
        puts "new time"
        @conversation = Conversation.create!(conversation_params)
      end
      redirect_to conversation_messages_path(@conversation)
    else
      flash[:notice]="Please log in!"
      redirect_to login_path
    end
  end

  def index
    @user_id = current_user.id
    @conversations = Conversation.all
  end
private
  def conversation_params
    params.permit(:sender_id, :recipient_id, :advertisement_id)
  end
end
