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
  
  private
  def community_params
    params.require(:community).permit(:image, :title, :description)
  end
end
