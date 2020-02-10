class RoomsController < ApplicationController

  
  def create
    @room = Room.create
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.create(params.require(:entry). permit(:room_id, :user_id). merge(room_id: @room.id))
    redirect_to room_path(@room.id)
  end
  
  def show  
    @room = Room.find(params[:id])
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
     # @entryuser = Entry.where(room_id: @room.id).where.not(user_id: current_user.id).first
      @entryuser = Entry.find_by("room_id = ? and user_id != ?", @room.id, current_user.id)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
end
