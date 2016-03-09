class WelcomeController < ApplicationController
def index
  @users = User.all
  @users.each do |user|
  @post = Post.where(user_id: user.id ).all
end
end
end
