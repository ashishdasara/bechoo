class MessagesController < ApplicationController
  before_action :require_proper_route_for_role, only: :index

  before_action :find_conversation , only: [:index, :new, :create]

  def index
    @messages = @conversation.messages
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.read = true;
      end
    end

    @message = @conversation.messages.new
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      if @conversation.messages.length == 1
        UserMailer.contact_message_email(@conversation.recipient_id, @conversation.sender_id).deliver_now
      end
      redirect_to conversation_messages_path(@conversation)
    end
  end

private
  def message_params
    params.require(:message).permit(:body, :user_id)
  end

  def find_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end
end
