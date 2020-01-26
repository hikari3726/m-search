class PostsController < ApplicationController
  
  def show
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to controller: 'communities', action: 'show', id: @post.community_id
    else
      flash.now[:danger] = "投稿失敗しました"
      redirect_to controller: 'communities', action: 'show', id: @post.community_id
    end
  end
  
  
  
  private
  def post_params
    params.require(:post).permit(:user_id, :community_id, :content)
  end
end
