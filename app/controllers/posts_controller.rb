class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    good_ids = allowed_user_ids
    @posts = Post.where('updated_at > ?', Time.now - 2.days).where(user_id: good_ids)
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :title, :body, :img_url)
  end

  def allowed_user_ids
    acceptedRequests = FollowRequest.where(accepted: true, sender_id: current_user.id)
    allowed_user_ids = acceptedRequests.pluck(:receiver_id)
    allowed_user_ids << current_user.id
  end
end
