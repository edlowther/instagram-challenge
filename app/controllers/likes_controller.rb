class LikesController < ApplicationController
  def create
    @like = Like.new
    @like.user = current_user
    post = Post.find(params[:like][:post_id])
    @like.post = post
    @like.save
    post.likes << @like
    post.save
    redirect_to user_post_path(:user_id => post.user.id, :id => post.id)
  end

  private
  def like_params
    params.require(:like).permit(:headline, :description, :photo)
  end
end
