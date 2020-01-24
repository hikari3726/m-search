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
  end

   def edit
    @user = User.find(params[:id])
   end
   
   def update
    @user =User.find(params[:id])
      if @user.update(user_params)
        redirect_to user_path(current_user.id), success: '変更しました'
      else 
        flash.now[:danger] = '変更失敗しました'
        render :edit
      end
   end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :gender, :age, :birthplace, :artist, :description)
  end
end
