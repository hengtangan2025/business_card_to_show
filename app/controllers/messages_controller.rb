class MessagesController < ApplicationController
  include SessionsHelper
  def create
    msg = Message.create(msg_params)
    if msg.save
      redirect_to "/cards/#{msg.user.card.id}"
    end
  end

  def user_msgs
    @msgs = current_user.messages
  end

  def destroy
    msg = Message.find(params[:id])
    msg.destroy
      redirect_to "/messages/user_msgs"
  end

  private
    def msg_params
      params.require(:message).permit(:name, :phone_num, :context, :user_id)
    end
end