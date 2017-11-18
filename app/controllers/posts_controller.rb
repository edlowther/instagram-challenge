class PostsController < ApplicationController
  def create
    if current_user
      @post = Post.new(post_params)
      @post.user = current_user
      @post.save
      redirect_to user_posts_path
    else
      flash[:notice] = "Cannot post if not signed in"
      redirect_to new_user_post_path
    end
  end

  def new
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.where(user_id: params[:user_id])
  end

  private
  def post_params
    params.require(:post).permit(:headline, :description, :photo)
  end
end
