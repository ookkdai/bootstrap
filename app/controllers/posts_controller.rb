class PostsController < ApplicationController

  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.order(id: :asc)
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create!(post_params)
    redirect_to post, notice: "投稿しました"
  end

  def destroy
    # ***** 以下を追加 *****
    post = Post.find(params[:id])
    post.destroy!
    redirect_to root_path, alert: "削除しました"
    # ***** 以上を追加 *****
  end

  def edit
    # ***** 以下を追加 *****
    
    # ***** 以上を追加 *****
  end

  def update
    # ***** 以下を追加 *****
    post.update!(post_params)
    redirect_to @post, notice: "更新しました"
    # ***** 以上を追加 *****
  end
  private
  def set_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
