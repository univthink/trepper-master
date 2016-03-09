class PostsController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def index
    @post = Post.all
    render partial: "post/all", layout: "application"
  end

  def show
    if params[:id].is_a? Integer
      @post1 = Post.find(params[:id])
      @post1.save
    end
    @post = Post.all
    render partial: "post/post", layout: "application"
  end

def new
  render 'posts/edit'
end

def create
  @post = Post.new
  @post.user_id = current_user.id.to_i
  @post.author_id = current_user.theid.to_i
  @post.title = post_params[:title]
  @post.body = post_params[:body]
  if @post.save
    redirect_to current_user
  end
end


  def update
    @post = Post.find(params[:id])
    @post.title = post_params[:title]
    @post.body = post_params[:body]
    @post.save
    redirect_to current_user
  end

  def destroy
    session[:return_to] ||= request.referer
    @url1 = request.original_url
    @url1 = @url1.split('/')[-1]
    if user_signed_in?
  #  @post = Post.find(@url1)
    @post = Post.find(params[:id])

    @post.destroy
    Post.all
    redirect_to session.delete(:return_to)
  else
    render partial: "post/error", layout: "error"
  end
  end

  def all
    @posts = @posts.sort_by { |post| post.author_id.size }.reverse
    render partial: "post/all", layout: "application"
  end

  def post_params
    params.require(:post).permit(:title, :body, :author_id)
  end


  def created
    params.require(:post).permit(:title, :body, :author_id)
    @post = Post.new
    @post.title = post_params[:title]
    @post.body = post_params[:body]
    @post.save
    redirect_to current_user
  end

end
