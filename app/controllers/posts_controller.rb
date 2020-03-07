class PostsController < ApplicationController
  
  def show
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to controller: 'communities', action: 'show', id: @post.community_id
    else
      
      #redirect_to :back ,flash: {danger: "入力されていない項目があります"}
      redirect_to controller: 'communities', action: 'show', id: @post.community_id, flash: {danger: "入力されていない項目があります"}
    end
  end
  
  
  
  private
  def post_params
    params.require(:post).permit(:user_id, :community_id, :content)
  end
end
