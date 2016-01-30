class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  skip_before_filter :verify_authenticity_token
  before_filter :set_current_user

  def set_current_user
    User.current_user = current_user
  end


  private
  def user_params
    params.require(:user).permit( :first_name, :title, :last_name, :theid, :image_file_name, :bio)
  end

  def post_params
    params.require(:title).permit(:post, :body, :author_id)
  end


end
