class PostsController < ApplicationController
  def index
    @posts = Post.order(id: :asc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create!(post_params)
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def destroy
    # ***** 以下を追加 *****
    post = Post.find(params[:id])
    post.destroy!
    redirect_to root_path
    # ***** 以上を追加 *****
  end
end
