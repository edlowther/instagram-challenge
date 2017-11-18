class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
  end

  def new
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:headline, :description)
  end
end
