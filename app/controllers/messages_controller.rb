class MessagesController < ApplicationController
  
  def create
    Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
    if @message = Message.create(message_params)
      redirect_to room_path(@message.room_id)
    else
      flash.now[:danger] = '変更失敗しました'
      render("rooms/show")
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:user_id, :content, :room_id).merge(user_id: current_user.id)
  end  
end
