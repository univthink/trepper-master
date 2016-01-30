class PostsController < ApplicationController

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def index
    @post = Post.all
    render partial: "post/all", layout: "application"
  end

  def show
    @post = Post.find(params[:id])
    render partial: "post/post", layout: "application"
    @post.author_id = @post.author_id + 1
    @post.save!
  end

  def new
    @posts = Post.all
    if user_signed_in?
    @post = Post.new
    @post.author_id = current_user.theid
    render partial: "post/new", layout: "application"
  else
    render partial: "post/error", layout: "error"
  end
end
  def create
    @posts = Post.all
    @post = Post.new(params[:id])
    @post.author_id = params[:id]
    if user_signed_in?
    @post.save!
    render partial: "welcome/index", layout: "application"
  else
    render partial: "post/error", layout: "error"
  end
  end

  def edit
    @post = Post.all
    @url = request.original_url
    @post = Post.find(params[:id])
    if user_signed_in?
      @post.save!
    render partial: "post/new", layout: "application"
    else
      render partial: "post/error", layout: "error"
  end
  end

  def update
    @post = Post.find(params[:id])
    if user_signed_in?
    if @post.update(post_params)
      redirect_to @post
    else
      render partial: "post/new", layout: "application"
    end
  end
    @post.save!
  end

def view
  redirect_to root_path
end

  def destroy
    @url1 = request.original_url
    @post = Post.find(params[:id])
    if user_signed_in?
    @post.destroy
    Post.all
    redirect_to root_path
    @post.save!
  else
    render partial: "post/error", layout: "error"
  end
  end
  def all
    @posts = @posts.sort_by { |post| post.author_id.size }.reverse
    render template: "users/index"
 end
end
