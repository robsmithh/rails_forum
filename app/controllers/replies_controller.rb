class RepliesController < ApplicationController

  def new
    @reply = Reply.new
    @post = Post.find(params[:post_id])
  end

  def create
    @reply = Reply.new(params.require(:reply).permit(:comment))
    @reply.user_id = current_user.id
    @reply.post_id = params[:post_id]
    if @reply.save
      flash[:notice] = 'Reply created successfully'
      redirect_to post_path(Post.find(params[:post_id]))
    else
      render 'new'
    end
  end

  def edit
    @reply = Reply.find(params[:id])
    @post = Post.find(params[:post_id])
  end

  def update
    @reply = Reply.find(params[:id])
    @post = Post.find(params[:post_id])
    if @reply.update(params.require(:reply).permit(:comment))
      flash[:notice] = "Reply successfully updated"
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    Reply.destroy(params[:id])
    flash[:notice] = "Post successfully deleted"
    redirect_to post_path(@post)
  end

  def reply_to_reply
    @new_reply = Reply.new
    @reply = Reply.find(params[:reply_id])
  end

  def create_reply_to_reply
    @new_reply = Reply.new(params.require(:reply).permit(:comment))
    @new_reply.user_id = current_user.id
    @new_reply.reply_to_reply = true
    @new_reply.reply_id = params[:reply_id]
    if @new_reply.save
      flash[:notice] = 'reply saved'
    else
      render 'reply_to_reply'
    end
  end

end
