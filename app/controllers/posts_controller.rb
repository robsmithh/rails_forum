class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :post))
    @post.user = current_user
    if @post.save
      flash[:notice] = "Post successfully created"
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def index
    @posts = Post.where(user_id: current_user.id)
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :post))
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

end