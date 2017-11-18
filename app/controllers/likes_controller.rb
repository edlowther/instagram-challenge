class LikesController < ApplicationController
  def create
    post = Post.find(params[:like][:post_id])
    if current_user
      if post.likes.map(&:user).include?(current_user)
        flash[:notice] = "Can't like a post more than once"
      else
        @like = Like.new
        @like.user = current_user
        @like.post = post
        @like.save
        post.likes << @like
        post.save
      end
    else
      flash[:notice] = "Can't like a post if not signed in"
    end
    redirect_to user_post_path(:user_id => post.user.id, :id => post.id)
  end

  private
  def like_params
    params.require(:like).permit(:headline, :description, :photo)
  end
end
