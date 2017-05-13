class PostsController < ApplicationController
  before_action :fetch_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all.reverse
  end

  def user_posts
    @posts = current_user.posts
  end

  def new
    @post = Post.new
  end

  def create
    return unless post_params[:user_id] == current_user.id.to_s
    @post = Post.new(post_params)
    @post.valid? ? create_post : handle_post_validation_failed
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post.update_attributes(post_params)
    @post.valid? ? update_post : handle_post_validation_failed
  end

  def edit; end

  def destroy
    @post.destroy!
    flash[:notice] = "Post #{@post.title} deleted"
    redirect_to posts_path
  end

  private

  def handle_post_validation_failed
    flash[:errors] = @post.errors.full_messages
    redirect_back(fallback_location: root_path)
  end

  def create_post
    @post.save
    flash[:notice] = 'Post created'
    redirect_to @post
  end

  def update_post
    @post.save
    flash[:notice] = 'Post updated'
    redirect_to @post
  end

  def post_params
    params.require(:post).permit(:title, :description, :expiration_date, :user_id)
  end

  def fetch_post
    @post = Post.find(params[:id])
  end
end
