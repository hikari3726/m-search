class JoinCommunitiesController < ApplicationController
  
  def show
    @join_communities = JoinCommunity.all
    @join_community = JoinCommunity.find_by(community_id: params[:id])
  end
  
  def create
    @join_community = JoinCommunity.new(user_id: params[:user_id], community_id: params[:community_id])
    #参加しています
    if @join_community.save
      redirect_to controller: 'communities', action: 'show', id: @join_community.community.id
      flash[:success] = '参加しました'
    else
      redirect_to controller: 'communities', action: 'show', id: @join_community.community_id
      flash[:danger] = 'ログインしてください'
    end
  end
  
  def destroy
    @join_community = JoinCommunity.find_by(user_id: params[:user_id], community_id: params[:community_id])
    #既に退会しています
    @join_community.destroy
    redirect_to controller: 'communities', action: 'show', id: @join_community.community.id
    flash[:danger] = '退会しました'
  end
  
end
