class WelcomeController < ApplicationController
def index
  @users = User.all
  @users.each do |user|
  @post = Post.where(user_id: user.id ).all
end
end
def feed
  @users = current_user.all_following
  @users.each do |user|
  @post = Post.where("user_id", user.id ).all
end
end

def feed
   if current_user.nil? == false
     follower_ids = ""
     current_user.all_following.each do |f|
       follower_ids = follower_ids +", "+ f.id.to_s
     end
     @posts = Post.select("posts.*").where("user_id IN (" + current_user.id.to_s + follower_ids+")").order(:created_at.to_s + " DESC")
   else
     @posts = Post.select("posts.*").order(:created_at).page(params[:page]).per(50)
   end
 end


end
