class RoomsController < ApplicationController
  def show
    @room = Room.new
    @rooms = Room.where(user_id: params[:id], sender_id: current_user.id )
  end
  
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_path(id: @room.user_id)
    else
      flash.now[:danger] = "メッセージを入れてください"
      redirect_to room_path(id: @room.user_id)
    end
  end
  
  private
  def room_params
    params.require(:room).permit(:user_id, :sender_id, :content)
  end
end
