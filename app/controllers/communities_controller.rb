class CommunitiesController < ApplicationController
  def new
    @community = Community.new
  end
  
  def create
    @community = current_user.communities.new(community_params)
    if @community.save
      redirect_to communities_path, success: 'コミュニティ作成しました'
    else
      flash.now[:danger] = "コミュニティ作成失敗しました"
      render :new
    end
  end
  
  def search
    @communities = Community.search(params[:search])
  end
  
  def index
    @communities = Community.all
  end
  
  def show
    @community = Community.find(params[:id])
    @communities = Community.all
    @post = Post.new
  end
  
  def destroy
    @community = Community.find(params[:id])
    @community.destroy
    redirect_to communities_path, success: 'コミュニティを削除しました'
  end
  
  def edit
    @community = Community.find(params[:id])
  end
  
  def update
    @community = Community.find(params[:id])
      if @community.update(community_params)
        redirect_to community_path(params[:id]), success: '変更しました'
      else
        flash.now[:danger] = '変更失敗しました'
        render :edit
      end
  end
  

  
  private
  def community_params
    params.require(:community).permit(:image, :title, :description)
  end
end
