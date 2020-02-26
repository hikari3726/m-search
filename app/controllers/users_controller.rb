class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: '登録が完了しました'
    else
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id 
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

   def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to root_path, danger: 'そのページにはいけません'
    end
   end
   
   def update
    @user = User.find(params[:id])
  
      if @user.update(user_params)
        redirect_to user_path(current_user.id), success: '変更しました'
      else 
        flash.now[:danger] = '変更失敗しました'
        render :edit
      end
   end
   
   def follow
     @user = User.find(params[:user_id])
     current_user.follow(@user)
     redirect_to user_path(@user.id)
   end

  def unfollow
    @user = User.find(params[:user_id])
    current_user.stop_following(@user)
    redirect_to user_path(@user.id)
  end
  
  def follow_list
    @user = User.find(params[:user_id])
  end

  def follower_list
    @user = User.find(params[:user_id])
  end
    
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :gender, :age, :artist, :description, :prefecture)
  end
  
end
