class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = current_user.likes.build(post_id: params[:post_id])
    @post = Post.find(params[:post_id])    
    @like.save
    @like_count = @post.likes.count
    respond_to do |format| 
      format.turbo_stream
    end
  end

  def destroy
    @like = current_user.likes.find_by(post_id: params[:post_id])
    @post = Post.find(params[:post_id])    
    @like.destroy
    @like_count = @post.likes.count
    respond_to do |format| 
      format.turbo_stream
    end
  end

  
end
