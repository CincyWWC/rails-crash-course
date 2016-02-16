class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post
  end

  def destroy
    post = Post.find(params[:id])
    flash[:success] = "Post \"#{post.title}\" was deleted."
    post.destroy
    redirect_to posts_path
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
