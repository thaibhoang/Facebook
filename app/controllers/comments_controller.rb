class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end

  def create
    @post = Post.find(params[:post_id])
    params[:comment][:user_id] = current_user.id
    @comment = @post.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      respond_to do |format|
        if @comment.destroy
          format.turbo_stream
        else
          redirect_to post_path(@comment.post)
        end
      end
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end
end
