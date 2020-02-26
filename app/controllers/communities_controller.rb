class CommunitiesController < ApplicationController
  def new
    @community = Community.new
  end
  
  def create
    @community = current_user.communities.new(community_params)
    if @community.save
      redirect_to communities_path, success: 'グループを作成しました'
    else
      render :new
    end
  end
  
  def index
    @communities = Community.all
    @q = Community.ransack(params[:q])
    @communities = @q.result(distinct: true)
  end
  
  def show
    @community = Community.find(params[:id])
    @post = Post.new
  end
  
  def destroy
    @community = Community.find(params[:id])
    @community.destroy
    redirect_to communities_path, danger: 'グループを削除しました'
  end
  
  def edit
    @community = Community.find(params[:id])
    if @community.user_id != current_user.id
      redirect_to root_path, danger: 'そのページにはいけません'
    end
  end
  
  def update
    @community = Community.find(params[:id])
      if @community.update(community_params)
        redirect_to community_path(params[:id]), success: '変更しました'
      else
        render :edit
      end
  end
  

  
  private
  def community_params
    params.require(:community).permit(:image, :title, :description)
  end
end
