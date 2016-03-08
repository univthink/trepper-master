class Post < ActiveRecord::Base
  belongs_to :user

  @posts = Post.all
  @post = Post.new(:title => "", :body => "")

end
