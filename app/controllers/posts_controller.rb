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
    @posts = Post.all
    if user_signed_in?
    @post = Post.new
    @post.author_id = current_user.theid.to_i
    render partial: "post/new", layout: "application"
  else
    render partial: "post/error", layout: "error"
  end
end
  def create1
    session[:return_to] ||= request.referer
    @post = Post.new(post_params)
    @post.user_id = current_user.id.to_i
    @post.author_id = current_user.theid.to_i
    if user_signed_in?
    @post.save
    redirect_to session.delete(:return_to)
    else
    render partial: "post/error", layout: "error"
  end
  end

  def create
    @posts = Post.all
    @post = Post.new(post_params)
    @post.user_id = current_user.id.to_i
    @post.author_id = current_user.theid.to_i
    if current_user_session
    @post.save
    render partial: "post/all", layout: "application"
  else
    render partial: "post/error", layout: "error"
  end
  end

  def edit
    @post = Post.find(params[:id])
    render partial: "post/new", layout: "application"
  end

  def update1
    @post = Post.find(params[:id])
    if user_signed_in?
    if @post.update(post_params)
      redirect_to @post
    else
      render partial: "post/new", layout: "application"
    end
  end
    @post.save
  end

  def update
  session[:referrer]=url_for(params)
  @post = Post.find(URI(request.referer).path.split('/')[-1])
  @post.update(post_params)
  if @post.save
    redirect_to @post
  else
    render 'post/edit'
  end
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
  private
  def post_params
    params.permit(:title, :post, :body, :author_id)
  end

end
